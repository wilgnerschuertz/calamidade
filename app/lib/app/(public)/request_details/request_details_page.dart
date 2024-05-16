import 'package:coopartilhar/app/(public)/request_details/request_details_card.dart';
import 'package:coopartilhar/app/features/auth/entities/user_entity.dart';
import 'package:coopartilhar/app/features/request_details/entities/request_details_entity.dart';
import 'package:coopartilhar/app/features/request_details/entities/status_details_entity.dart';
import 'package:core_module/core_module.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

class RequestDetailsPage extends StatefulWidget {
  const RequestDetailsPage({super.key});

  @override
  State<RequestDetailsPage> createState() => _RequestDetailsPageState();
}

class _RequestDetailsPageState extends State<RequestDetailsPage> {
  //TODO: receber o id por parâmetro, buscar os dados pelo controller e adicionar o gerenciamento de estado (loading, error, success)
  //late final RequestDetailsController _controller;
  @override
  void initState() {
    super.initState();
    // _controller = coreModule.get<RequestDetailsController>();
    // _controller.loadRequestDetails(id: id);
  }

  final request = RequestDetailsEntity(
    id: '0',
    title: 'Reconstrução telhado',
    user: UserEntity(
      //TODO: a entidade precisa de mais campos (endereço, telefone)
      '0',
      'teste@teste.com',
      'João Maria da silva',
    ),
    createdAt: DateTime.now(),
    price: 3500.00,
    status: StatusDetailsEntity(
      '',
      Status.high,
      'Estamos precisando de ajuda para comprar medicamentos e roupas.',
    ),
  );

  @override
  Widget build(BuildContext context) {
    final colors = CoopartilharColors.of(context);
    final texTheme = Theme.of(context).textTheme;
    return SafeArea(
      child: Scaffold(
        body: Stack(
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
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 32.0),
                      child: Icon(
                        UIcons.regularRounded.document_signed,
                        size: 46.0,
                        color: colors.primary,
                      ),
                    ),
                    Text(
                      'Detalhes da solicitação',
                      style: texTheme.displayLarge
                          ?.copyWith(color: colors.textColor),
                    ),
                    const SizedBox(height: 32.0),
                    RequestDetailsCard(request: request),
                  ],
                ),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: CooButton.primary(
                  label: 'Próximo',
                  onPressed: () {},
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
