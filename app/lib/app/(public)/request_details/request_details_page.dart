import 'package:coopartilhar/app/(public)/request_details/widgets/request_details_card/request_details_card.dart';
import 'package:coopartilhar/app/(public)/request_details/widgets/request_details_card/request_details_card_description.dart';
import 'package:coopartilhar/app/(public)/request_details/widgets/request_details_card/request_details_card_situation.dart';
import 'package:coopartilhar/app/(public)/request_details/widgets/request_details_page_header.dart';
import 'package:coopartilhar/app/features/auth/interactor/controllers/login_controller_impl.dart';
import 'package:coopartilhar/app/features/request_details/interactor/controllers/request_details_controller.dart';
import 'package:coopartilhar/app/features/request_details/interactor/state/request_state.dart';
import 'package:coopartilhar/injector.dart';
import 'package:coopartilhar/routes.dart';
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
  final userController = injector.get<LoginControllerImpl>();

  UserEntity user = UserEntity.init();

  @override
  void initState() {
    super.initState();
    final id = Routefly.query.arguments['id'];

    if (userController.state case SuccessState(:final data)) {
      setState(() {
        user = data as UserEntity;
      });
    }

    _controller.addListener(listener);
    _controller.loadRequestDetails(id: id.toString());
  }

  void listener() {
    return switch (_controller.state) {
      ErrorState(:final exception) =>
        Alerts.showFailure(context, exception.message),
      SuccessPatronizeState() => Routefly.navigate(
          routePaths.home), // TODO: enviar para a pagina success_state_page
      _ => null,
    };
  }

  @override
  void dispose() {
    _controller.removeListener(listener);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ValueListenableBuilder(
          valueListenable: _controller,
          builder: (context, state, _) {
            return switch (state) {
              LoadingState() =>
                const Center(child: CircularProgressIndicator()),
              SuccessState<RequestEntity>(:final data) => Stack(
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
                              title: data.title,
                            ),
                            RequestDetailsCard(request: data),
                            const SizedBox(height: 16.0),
                            RequestDetailsCardDescription(
                              description: data.description,
                            ),
                            const SizedBox(height: 16.0),
                            RequestDetailsCardSituation(
                              description: '',
                              status: data.status,
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8.0, vertical: 8.0),
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: (data.godFather == null &&
                                data.user.id != user.id)
                            ? CooButton.primary(
                                label: 'Apadrinhar',
                                onPressed: () async => _controller.patronize(
                                  godFatherId: user.id!,
                                  request: data,
                                ),
                              )
                            : CooButton.primary(
                                label: 'Voltar',
                                onPressed: () => Routefly.pop(context),
                              ),
                      ),
                    ),
                  ],
                ),
              _ => const SizedBox.shrink(),
            };
          },
        ),
      ),
    );
  }
}
