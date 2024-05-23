import 'package:coopartilhar/app/(public)/ask_help/new_ask_help/new_ask_help_page.dart';
import 'package:coopartilhar/app/features/address/entities/address_entity.dart';
import 'package:coopartilhar/app/features/address/interactor/controllers/new_address_controller.dart';
import 'package:coopartilhar/app/features/address/interactor/states/address_location_states.dart';
import 'package:coopartilhar/app/features/address/interactor/states/address_states.dart';
import 'package:coopartilhar/injector.dart';
import 'package:core_module/core_module.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

class NewAddressPage extends StatefulWidget {
  final String title;
  const NewAddressPage({super.key, this.title = 'Cadastrar Endereço'});

  @override
  State<NewAddressPage> createState() => _NewAddressPageState();
}

class _NewAddressPageState extends State<NewAddressPage> {
  final NewAddressController controller = injector.get<NewAddressController>();

  @override
  void initState() {
    super.initState();
    controller.addListener(listener);
  }

  @override
  void dispose() {
    controller.removeListener(listener);
    super.dispose();
  }

  void listener() {
    return switch (controller.state) {
      SuccessState(:final AddressEntity data) => {
          Alerts.showSuccess(
              context, 'Endereço "${data.addressName}" criado com sucesso!'),
          Routefly.pop(context)
        },
      ErrorState(:final exception) =>
        Alerts.showFailure(context, exception.message),
      AddressLocationErrorState() => {
          Alerts.showFailure(context, 'Falha ao recuperar localização')
        },
      _ => null,
    };
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(UIcons.regularStraight.angle_small_left),
          onPressed: () {
            Routefly.pop(context);
          },
        ),
        title: Text(
          widget.title,
          style: textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: ValueListenableBuilder(
          valueListenable: controller,
          builder: (context, state, _) {
            return Stack(alignment: Alignment.bottomCenter, children: [
              const Image(image: CooImages.cooBackgroundDetails),
              SingleChildScrollView(
                child: Form(
                  key: controller.formKey,
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const TextInformationExtends(
                                text: 'Identificação do Endereço*'),
                            TextFormField(
                              controller: controller.identificationController,
                              decoration: const InputDecoration(
                                hintText: 'Identificação do Endereço',
                              ),
                              validator: (String? value) {
                                if (value == null || value.isEmpty) {
                                  return 'Identificação do Endereço não pode estar vazio';
                                }
                                return null;
                              },
                            ),
                            const TextInformationExtends(text: 'Logradouro*'),
                            TextFormField(
                              controller: controller.addressController,
                              decoration: const InputDecoration(
                                hintText: 'Logradouro',
                              ),
                              validator: (String? value) {
                                if (value == null || value.isEmpty) {
                                  return 'Logradouro não pode estar vazio';
                                }
                                return null;
                              },
                            ),
                            const TextInformationExtends(text: 'Número*'),
                            TextFormField(
                              controller: controller.addressNumberController,
                              keyboardType: TextInputType.number,
                              decoration: const InputDecoration(
                                hintText: 'Número',
                              ),
                              validator: (String? value) {
                                if (value == null || value.isEmpty) {
                                  return 'Número não pode estar vazio';
                                }
                                return null;
                              },
                            ),
                            const TextInformationExtends(text: 'Cidade*'),
                            TextFormField(
                              controller: controller.cityController,
                              decoration: const InputDecoration(
                                hintText: 'Cidade',
                              ),
                              validator: (String? value) {
                                if (value == null || value.isEmpty) {
                                  return 'Cidade não pode estar vazio';
                                }
                                return null;
                              },
                            ),
                            const TextInformationExtends(text: 'UF*'),
                            TextFormField(
                              controller: controller.ufController,
                              maxLength: 2,
                              decoration: const InputDecoration(
                                hintText: 'UF',
                              ),
                              validator: (String? value) {
                                if (value == null || value.isEmpty) {
                                  return 'UF não pode estar vazio';
                                }
                                return null;
                              },
                            ),
                            const TextInformationExtends(text: 'CEP*'),
                            TextFormField(
                              controller: controller.zipCodeController,
                              keyboardType: TextInputType.number,
                              inputFormatters: [ZipCodeInputFormatter()],
                              decoration: const InputDecoration(
                                hintText: 'CEP',
                              ),
                              validator: (String? value) {
                                if (value == null || value.isEmpty) {
                                  return 'CEP não pode estar vazio';
                                }
                                return null;
                              },
                            ),
                            const TextInformationExtends(text: 'Complemento'),
                            TextFormField(
                              controller: controller.complementController,
                              decoration: const InputDecoration(
                                hintText: 'Complemento',
                              ),
                            ),
                            const TextInformationExtends(
                                text: 'Localização(geo/endereço)'),
                            CooInputButton(
                              controller: controller.geoLocationController,
                              isLoading: state is AddressLocationLoadingState,
                              iconData: UIcons.solidRounded.location_alt,
                              onTap: () async {
                                controller.geoLocation();
                              },
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 10),
                      CooButton.primary(
                        label:
                            (state is LoadingState) ? 'Aguarde...' : 'Salvar',
                        onPressed: controller.save,
                        size: const Size(double.infinity, 60),
                        enable: state is! AddressLoadingState &&
                            state is! LoadingState,
                      ),
                      const SizedBox(height: 10),
                    ],
                  ),
                ),
              )
            ]);
          }),
    );
  }
}
