import 'package:coopartilhar/app/(public)/auth/check_affiliated/check_affiliated_page.dart';
import 'package:coopartilhar/app/features/ask_help/interactor/controllers/ask_help_controller.dart';
import 'package:coopartilhar/app/features/ask_help/interactor/state/file_state.dart';
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

  @override
  void initState() {
    super.initState();
    controller.addListener(listener);
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
    controller.dispose();
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
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: SingleChildScrollView(
                    child: Form(
                      key: controller.formKey,
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
                          const TextInformationExtends(text: 'Chave pix'),
                          TextFormField(
                            controller: controller.pixKeyController,
                            decoration: const InputDecoration(
                              hintText: 'Insira a chave pix do Assistido',
                            ),
                          ),
                          const TextInformationExtends(text: 'Banco'),
                          TextFormField(
                            controller: controller.bankController,
                            decoration: const InputDecoration(
                              hintText: 'Insira o banco do Assistido',
                            ),
                          ),
                          const TextInformationExtends(text: 'Agência'),
                          TextFormField(
                            controller: controller.agencyController,
                            keyboardType: TextInputType.number,
                            decoration: const InputDecoration(
                              hintText:
                                  'Insira a agência bancária do Assistido',
                            ),
                          ),
                          const TextInformationExtends(text: 'Conta'),
                          TextFormField(
                            controller: controller.accountController,
                            keyboardType: TextInputType.number,
                            decoration: const InputDecoration(
                              hintText: 'Insira a conta bancária do Assistido',
                            ),
                          ),
                          const TextInformationExtends(text: 'Valor*'),
                          TextFormField(
                            controller: controller.valueController,
                            keyboardType: TextInputType.number,
                            decoration: const InputDecoration(
                              hintText: 'R\$ 5.000,00',
                            ),
                            validator: controller.valueValidator,
                            inputFormatters: [
                              CurrencyFormatter(),
                            ],
                          ),
                          const TextInformationExtends(text: 'Enviar arquivo*'),
                          InkWell(
                            onTap: controller.pickFile,
                            child: Container(
                              padding: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(8)),
                                color: colorsTheme.primary,
                              ),
                              child: Icon(
                                UIcons.regularStraight.clip,
                                color: colorsTheme.white,
                              ),
                            ),
                          ),
                          if (controller.files.isNotEmpty)
                            CooFilePreview(
                              type: FilePreviewType.file,
                              path: controller.files.first,
                            ),
                          const TextInformationExtends(text: 'Breve descrição'),
                          TextFormField(
                            controller: controller.descriptionController,
                            maxLines: 8,
                            decoration: const InputDecoration(
                              hintText:
                                  'Insira uma breve descrição sobre sua solicitação',
                            ),
                          ),
                          const SizedBox(height: 50),
                          CooButton(
                            label:
                                state is LoadingState ? 'Aguarde' : 'Próximo',
                            onPressed: controller.submiSolicitation,
                            enable: state is! LoadingState,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            );
          }),
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
