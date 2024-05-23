import 'package:coopartilhar/app/(public)/auth/check_affiliated/check_affiliated_page.dart';
import 'package:coopartilhar/app/features/address/interactor/controllers/address_controller.dart';
import 'package:coopartilhar/app/features/address/interactor/states/address_states.dart';
import 'package:coopartilhar/app/features/ask_help/interactor/controllers/ask_help_controller.dart';
import 'package:coopartilhar/app/features/ask_help/interactor/state/file_state.dart';
import 'package:coopartilhar/app/features/bank_account/interactor/controllers/bank_account_controller.dart';
import 'package:coopartilhar/app/features/bank_account/interactor/states/bank_states.dart';
import 'package:coopartilhar/routes.dart';
import 'package:core_module/core_module.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:coopartilhar/injector.dart';

class NewAskHelpPage extends StatefulWidget {
  const NewAskHelpPage({super.key, this.title = 'Solicitação'});
  final String title;

  @override
  State<NewAskHelpPage> createState() => _NewAskHelpPageState();
}

class _NewAskHelpPageState extends State<NewAskHelpPage> {
  final controller = injector.get<AskHelpController>();
  final addressController = injector.get<AddressController>();
  final bankAccountController = injector.get<BankAccountController>();

  @override
  void initState() {
    super.initState();
    controller.addListener(listener);
    addressController.addListener(listenerAddress);
    bankAccountController.addListener(listenerBankAccount);
  }

  void listenerBankAccount() {
    return switch (bankAccountController.state) {
      BankAccountLoadedState(:final selectedBankAccount) =>
        controller.changeBankAccount(selectedBankAccount),
      _ => null,
    };
  }

  void listenerAddress() {
    return switch (addressController.state) {
      AddressLoadedState(:final selectedAddress) =>
        controller.changeAddress(selectedAddress),
      RemoveAddressSuccessState() => {
          controller.changeAddress(null),
        },
      _ => null,
    };
  }

  void listener() {
    return switch (controller.state) {
      SuccessState() => Routefly.navigate(
          routePaths.affiliatedFirstAction.presentation.affiliatedFirstAction),
      FileErrorState() =>
        Alerts.showFailure(context, 'Arquivo não pode ser vazio'),
      ErrorState(:final exception) =>
        Alerts.showFailure(context, exception.message),
      _ => null,
    };
  }

  @override
  void dispose() {
    controller.removeListener(listener);
    addressController.removeListener(listenerAddress);
    bankAccountController.removeListener(listenerBankAccount);
    // controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorsTheme = CoopartilharColors.of(context);

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
          return Stack(
            alignment: Alignment.bottomCenter,
            children: [
              const Image(image: CooImages.cooBackgroundDetails),
              SingleChildScrollView(
                child: Form(
                  key: controller.formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Valor pré-aprovado',
                                  style: textTheme.titleMedium,
                                ),
                                const SizedBox(height: 30),
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 2,
                                    horizontal: 8,
                                  ),
                                  decoration: BoxDecoration(
                                    color: colorsTheme.lightGrey,
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(8)),
                                  ),
                                  child: Text(
                                    CurrencyAdapter.doubleToBRL(
                                        controller.preApprovedValue),
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: colorsTheme.primary,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const TextInformationExtends(
                                text: 'Titulo da solicitação*'),
                            TextFormField(
                              controller: controller.titleController,
                              decoration: const InputDecoration(
                                hintText: 'Insira o titulo para solicitação',
                              ),
                              validator: (String? value) {
                                if (value == null || value.isEmpty) {
                                  return 'Titulo não pode esta vazio';
                                }
                                return null;
                              },
                            ),
                            const TextInformationExtends(
                                text: 'CPF do Assistido*'),
                            TextFormField(
                              controller: controller.cpfController,
                              keyboardType: TextInputType.number,
                              maxLength: 14,
                              decoration: const InputDecoration(
                                hintText: 'Insira o CPF do Assistido',
                              ),
                              inputFormatters: [
                                CpfCnpjFormatter(),
                              ],
                              validator: (String? value) {
                                if (value == null || value.isEmpty) {
                                  return 'CPF não pode esta vazio';
                                }
                                return ValidatorsHelper.isValidCPF(value)
                                    ? null
                                    : 'CPF inválido';
                              },
                            ),
                            const TextInformationExtends(text: 'Valor*'),
                            TextFormField(
                              controller: controller.valueController,
                              keyboardType: TextInputType.number,
                              decoration: const InputDecoration(
                                hintText: 'R\$ 5.000,00',
                                errorMaxLines: 3,
                              ),
                              validator: controller.valueValidator,
                              inputFormatters: [
                                CurrencyFormatter(),
                              ],
                            ),
                            const TextInformationExtends(text: 'Localização*'),
                            CooInputButton(
                              controller: controller.localizationController,
                              iconData: UIcons.solidRounded.location_alt,
                              onTap: () async {
                                await Routefly.push(
                                  '/address',
                                );
                                addressController
                                    .getAll(controller.addressEntity);
                              },
                            ),
                            const TextInformationExtends(
                                text: 'Dados Bancarios'),
                            CooInputButton(
                              controller: controller.accountBankController,
                              iconData: UIcons.solidRounded.bank,
                              onTap: () async {
                                await Routefly.push(
                                  '/bank_account',
                                );
                                bankAccountController
                                    .getAll(controller.bankAccountEntity);
                              },
                            ),
                            const TextInformationExtends(
                                text: 'Enviar arquivo*'),
                            Container(
                              margin: const EdgeInsets.symmetric(vertical: 10),
                              child: CooIconButton(
                                icon: UIcons.regularStraight.clip,
                                onTap: controller.pickFile,
                              ),
                            ),
                            if (controller.files.isNotEmpty)
                              CooFilePreview(
                                type: FilePreviewType.file,
                                path: controller.files.first,
                              ),
                            const TextInformationExtends(
                                text: 'Breve descrição'),
                            TextFormField(
                              controller: controller.descriptionController,
                              maxLines: 8,
                              decoration: const InputDecoration(
                                hintText:
                                    'Insira uma breve descrição sobre sua solicitação',
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 10),
                      CooButton.primary(
                        label: state is LoadingState ? 'Aguarde' : 'Próximo',
                        onPressed: controller.submiSolicitation,
                        enable: state is! LoadingState,
                        size: const Size(double.infinity, 60),
                      ),
                      const SizedBox(height: 10),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

class TextInformationExtends extends StatelessWidget {
  const TextInformationExtends({super.key, required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 20),
        Text(text),
      ],
    );
  }
}
