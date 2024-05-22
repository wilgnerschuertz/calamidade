import 'package:coopartilhar/app/(public)/request_details/widgets/request_details_card/request_details_card.dart';
import 'package:coopartilhar/app/(public)/request_details/widgets/request_details_page_header.dart';
import 'package:coopartilhar/app/features/request_details/interactor/controllers/request_details_controller.dart';
import 'package:coopartilhar/injector.dart';
import 'package:core_module/core_module.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

class RequestDetailsPage extends StatefulWidget {
  const RequestDetailsPage({super.key});

  @override
  State<RequestDetailsPage> createState() => _RequestDetailsPageState();
}

class _RequestDetailsPageState extends State<RequestDetailsPage> {
  late final RequestDetailsController _controller =
      injector.get<RequestDetailsController>();
  RequestEntity? request;
  String errorMessage = '';
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    final id = Routefly.query.arguments['id'];

    _controller.addListener(listener);
    _controller.loadRequestDetails(id: id!);
  }

  void listener() {
    if (_controller.value is SuccessState) {
      request = (_controller.value as SuccessState<RequestEntity>).data;
      setLoading(false);
    } else if (_controller.value is LoadingState) {
    } else if (_controller.value is ErrorState<BaseException>) {
      errorMessage =
          (_controller.value as ErrorState<BaseException>).exception.message;
      if (errorMessage.isEmpty) {
        errorMessage = 'Error desconhecido';
      }
      setLoading(false);
    }
  }

  void setLoading(bool value) {
    setState(() {
      isLoading = value;
    });
  }

  @override
  void dispose() {
    _controller.removeListener(listener);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }

    if (!isLoading && errorMessage.isNotEmpty) {
      return Scaffold(
          body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          RequestDetailsPageHeader(title: errorMessage),
          CooButton.primary(
            label: 'Tentar novamente',
            onPressed: () async {
              setLoading(true);
              errorMessage = '';
              await Future.delayed(const Duration(seconds: 1));
              _controller.loadRequestDetails(
                id: Routefly.query.arguments['id'],
              );
            },
          )
        ],
      ));
    }
    return SafeArea(
      child: Scaffold(
        body: Visibility(
          child: Center(
            child: Stack(
              children: [
                const Align(
                  alignment: Alignment.bottomCenter,
                  child: Image(
                    image: CooImages.cooBackgroundDetails,
                  ),
                ),
                SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        RequestDetailsPageHeader(
                          title: request?.title ?? '',
                        ),
                        request != null
                            ? RequestDetailsCard(request: request!)
                            : const SizedBox.shrink(),
                        const SizedBox(height: 96.0),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 8.0, vertical: 8.0),
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: CooButton.primary(
                      label: 'Próximo',
                      onPressed: () {},
                    ),
                  ),
                ),
                Visibility(
                  visible: isLoading,
                  child: const Center(child: CircularProgressIndicator()),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
