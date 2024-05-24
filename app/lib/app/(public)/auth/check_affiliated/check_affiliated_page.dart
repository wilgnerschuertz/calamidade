import 'package:coopartilhar/app/features/check_affiliated/data/errors/not_affiliated_error.dart';
import 'package:coopartilhar/app/features/check_affiliated/interactor/check_affiliated_controller.dart';
import 'package:coopartilhar/injector.dart';
import 'package:coopartilhar/routes.dart';
import 'package:core_module/core_module.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gap/gap.dart';

class CheckAffiliatedPage extends StatefulWidget {
  const CheckAffiliatedPage({super.key});

  @override
  State<CheckAffiliatedPage> createState() => _CheckAffiliatedPageState();
}

class _CheckAffiliatedPageState extends State<CheckAffiliatedPage> {
  final controller = injector.get<CheckAffiliatedController>();
  String? document;
  final formKey = GlobalKey<FormState>();
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    controller.addListener(listener);
  }

  void submit() async {
    if (formKey.currentState!.validate()) {
      setLoading(true);
      await controller.check(document: document!);
    }
  }

  void setLoading(bool value) => setState(() {
        isLoading = value;
      });

  void listener() async {
    if (controller.value is ErrorState<BaseException>) {
      final err = (controller.value as ErrorState<BaseException>);
      if (err.exception is NotAffiliatedError) {
        Routefly.push(routePaths.auth.notAffiliated);
        setLoading(false);
      } else {
        setLoading(false);
        Alerts.showFailure(context, 'Error desconhecido, tente novamente.');
      }
    } else if (controller.value is SuccessState) {
      setLoading(false);
      Routefly.push(routePaths.auth.affiliated);
    }
  }

  @override
  void dispose() {
    controller.removeListener(listener);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double widthScreen = MediaQuery.sizeOf(context).width;
    final colors = CoopartilharColors.of(context);
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'É cooperado?',
          style: Theme.of(context)
              .textTheme
              .displayLarge!
              .copyWith(color: colors.appBackground),
        ),
      ),
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          const Image(image: CooImages.cooBackgroundDetails),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: widthScreen * 0.04),
            child: Form(
              key: formKey,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Spacer(),
                  const Center(
                      child: Image(image: CooImages.cooBrand2, height: 166)),
                  const Spacer(),
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Text('Informe o seu CPF/CNPJ',
                          style: theme.textTheme.titleMedium!
                              .copyWith(color: colors.appBackground),
                          textAlign: TextAlign.start)),
                  TextFormField(
                    style: theme.textTheme.displaySmall!
                        .copyWith(color: colors.appBackground),
                    keyboardType: TextInputType.number,
                    inputFormatters: [
                      CpfCnpjFormatter(),
                    ],
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'Este CPF / CNPJ não existe!';
                      }
                      document = value;
                      return null;
                    },
                    onFieldSubmitted: (_) => submit,
                  ),
                  const Spacer(),
                  CooButton.primary(
                    label: 'Verificar',
                    onPressed: submit,
                    isLoading: isLoading,
                  ),
                  const Gap(10),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class CpfCnpjFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    final text = newValue.text;
    final shouldReturnToCpfFormat =
        oldValue.text.length > text.length && text.length == 15;
    final removedCharacteres = text.replaceAll(RegExp('[^0-9]'), '');

    final maskedText = _applyMask(removedCharacteres, shouldReturnToCpfFormat);
    return TextEditingValue(
      text: maskedText,
      selection: TextSelection.collapsed(offset: maskedText.length),
    );
  }

  String _applyMask(
    String text,
    bool shouldReturnToCpfFormat,
  ) {
    if (text.length <= 11) {
      if (text.length <= 3) {
        return text;
      } else if (text.length <= 6) {
        return '${text.substring(0, 3)}.${text.substring(3)}';
      } else if (text.length <= 9) {
        return '${text.substring(0, 3)}.${text.substring(3, 6)}.${text.substring(6)}';
      } else {
        return '${text.substring(0, 3)}.${text.substring(3, 6)}.${text.substring(6, 9)}-${text.substring(9)}';
      }
    } else {
      if (text.length == 12 && shouldReturnToCpfFormat) {
        text = text.substring(0, text.length - 1);
        return '${text.substring(0, 3)}.${text.substring(3, 6)}.${text.substring(6, 9)}-${text.substring(9)}';
      }
      if (text.length <= 14) {
        return '${text.substring(0, 2)}.${text.substring(2, 5)}.${text.substring(5, 8)}/${text.substring(8, 12)}-${text.substring(12)}';
      } else {
        return '${text.substring(0, 2)}.${text.substring(2, 5)}.${text.substring(5, 8)}/${text.substring(8, 12)}-${text.substring(12, 14)}';
      }
    }
  }
}
