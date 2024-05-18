import 'package:coopartilhar/app/features/check_affiliated/data/errors/not_affiliated_error.dart';
import 'package:coopartilhar/app/features/check_affiliated/interactor/check_affiliated_controller.dart';
import 'package:coopartilhar/injector.dart';
import 'package:coopartilhar/routes.dart';
import 'package:core_module/core_module.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

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
        await Navigator.of(context)
            .pushNamed<void>(routePaths.auth.notAffiliated);
        setLoading(false);
      } else {
        setLoading(false);
        Alerts.showFailure(context, 'Error desconhecido, tente novamente.');
      }
    } else if (controller.value is SuccessState) {
      Navigator.of(context).pushNamed<void>(routePaths.auth.register);
    }
  }

  @override
  void dispose() {
    controller.removeListener(listener);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double heightScreen = MediaQuery.sizeOf(context).height;
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
        leading: IconButton(
          icon: const Icon(Icons.chevron_left),
          onPressed: () {
            Navigator.of(context).pop();
          },
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
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: heightScreen * 0.20,
                    ),
                    child: const Image(image: CooImages.cooBrand1),
                  ),
                  Row(
                    children: [
                      Text(
                        'Informe o seu CPF/CNPJ',
                        style: theme.textTheme.titleMedium!
                            .copyWith(color: colors.appBackground),
                        textAlign: TextAlign.start,
                      ),
                    ],
                  ),
                  Center(
                    child: TextFormField(
                      style: theme.textTheme.displaySmall!
                          .copyWith(color: colors.appBackground),
                      validator: (String? value) {
                        if (value == null || value.isEmpty) {
                          return 'Este CPF / CNPJ não existe!';
                        }
                        document = value;
                        return null;
                      },
                      onFieldSubmitted: (_) => submit,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: heightScreen * 0.18),
                    child: CooButton.primary(
                      label: 'Verificar',
                      onPressed: submit,
                      isLoading: isLoading,
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
