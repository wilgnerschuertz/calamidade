import 'package:coopartilhar/app/features/forgot_password/interactor/controllers/forgot_password_controller.dart';
import 'package:coopartilhar/injector.dart';
import 'package:coopartilhar/routes.dart';
import 'package:core_module/core_module.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final controller = injector.get<ForgotPasswordController>();

  @override
  void initState() {
    super.initState();
    controller.addListener(listener);
  }

  void listener() {
    return switch (controller.value) {
      SuccessState() => Routefly.navigate(routePaths.auth.login.resetPassword),
      ErrorState(:final exception) =>
        Alerts.showFailure(context, exception.message),
      _ => null,
    };
  }

  @override
  void dispose() {
    controller.removeListener(listener);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
        width: 60,
        height: 60,
        textStyle: Theme.of(context).textTheme.bodyLarge!.copyWith(
            color: CoopartilharColors.of(context).textColor, fontSize: 28),
        decoration: BoxDecoration(
          color: CoopartilharColors.of(context).lightGrey,
          borderRadius: BorderRadius.circular(20),
        ));

    final cursor = Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        width: 21,
        height: 1,
        margin: const EdgeInsets.only(bottom: 12),
        decoration: BoxDecoration(
          color: CoopartilharColors.of(context).black,
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );

    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: Colors.transparent,
        leading: IconButton(
          icon: const Icon(Icons.chevron_left),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: ValueListenableBuilder(
          valueListenable: controller,
          builder: (context, value, child) {
            if (controller.value is LoadingState) {
              return const Center(child: CircularProgressIndicator());
            }
            return SafeArea(
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Digite o código de recuperação',
                          textAlign: TextAlign.center,
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge!
                              .copyWith(
                                  color: CoopartilharColors.of(context).primary,
                                  fontSize: 28),
                        ),
                        Container(
                          padding: const EdgeInsets.only(top: 10),
                          width: 300,
                          child: Text(
                            'Digite o código de verificação de 4 números que enviamos para o seu e-mail cadastrado.',
                            textAlign: TextAlign.center,
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall!
                                .copyWith(
                                    color: CoopartilharColors.of(context)
                                        .textColor,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600),
                          ),
                        ),
                        const SizedBox(height: 20),
                        Pinput(
                          length: 4,
                          controller: controller.pinputController,
                          defaultPinTheme: defaultPinTheme,
                          separatorBuilder: (index) =>
                              const SizedBox(width: 25),
                          focusedPinTheme: defaultPinTheme.copyWith(
                            decoration: BoxDecoration(
                              color: CoopartilharColors.of(context).lightGrey,
                              borderRadius: BorderRadius.circular(8),
                              boxShadow: const [
                                BoxShadow(
                                  color: Color.fromRGBO(
                                      0, 0, 0, 0.05999999865889549),
                                  offset: Offset(0, 3),
                                  blurRadius: 16,
                                ),
                              ],
                            ),
                          ),
                          showCursor: true,
                          cursor: cursor,
                        )
                      ],
                    ),
                  ),
                  CooButton.primary(
                    label: 'Redefinir senha',

                    // TODO: Precisa da entity do user que contém o email para conseguir enviar o mesmo.
                    // onPressed: () => controller.sendEmailPass(),
                    onPressed: () =>
                        Routefly.navigate(routePaths.auth.login.resetPassword),

                    size: const Size(double.infinity, 50),
                  ),
                ],
              ),
            );
          }),
    );
  }
}
