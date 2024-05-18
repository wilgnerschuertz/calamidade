import 'package:coopartilhar/app/(public)/request_details/widgets/request_details_card/request_details_card.dart';
import 'package:coopartilhar/app/(public)/request_details/widgets/request_details_page_header.dart';
import 'package:coopartilhar/app/features/auth/interactor/entities/user_entity.dart';
import 'package:coopartilhar/app/features/request_details/entities/request_details_entity.dart';
import 'package:coopartilhar/app/features/request_details/entities/status_details_entity.dart';
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
    id: -1,
    title: 'Reconstrução telhado',
    user: UserEntity(
      //TODO: a entidade precisa de mais campos (endereço, telefone)
      -1,
      email: 'teste@teste.com',
      name: 'João Maria da silva',
      document: '',
      phone: '',
    ),
    createdAt: DateTime.now(),
    price: 3500.00,
    status: StatusDetailsEntity(
      -1,
      Status.high,
      'Estamos precisando de ajuda para comprar medicamentos e roupas.',
    ),
  );

  @override
  Widget build(BuildContext context) {
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
                    const RequestDetailsPageHeader(
                      title: 'Detalhes da Solicitação',
                    ),
                    RequestDetailsCard(request: request),
                    const SizedBox(height: 96.0),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
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
