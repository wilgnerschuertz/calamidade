import 'package:coopartilhar/app/(public)/auth/login/widgets/password_text_form_field.dart';
import 'package:coopartilhar/app/features/reset_password/interactor/controllers/reset_password_controller.dart';
import 'package:coopartilhar/injector.dart';
import 'package:coopartilhar/routes.dart';
import 'package:core_module/core_module.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

class ResetPasswordPage extends StatefulWidget {
  const ResetPasswordPage({super.key});

  @override
  State<ResetPasswordPage> createState() => _ResetPasswordPageState();
}

class _ResetPasswordPageState extends State<ResetPasswordPage> {
  final controller = injector.get<ResetPasswordController>();

  @override
  void initState() {
    super.initState();
    controller.addListener(listener);
  }

  void listener() {
    return switch (controller.value) {
      ErrorState(:final exception) =>
        Alerts.showFailure(context, exception.message),
      SuccessState() => Routefly.navigate(routePaths.auth.login.path),
      _ => null,
    };
  }

  void _reset() {
    if (controller.formKey.currentState!.validate()) {
      controller.resetPassword();
      return;
    }
  }

  @override
  void dispose() {
    controller.removeListener(listener);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorsTheme = CoopartilharColors.of(context);

    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: Colors.transparent,
        title: Text(
          'Nova senha',
          style: textTheme.bodyLarge!.copyWith(
              color: colorsTheme.textColor,
              fontSize: 20,
              fontWeight: FontWeight.bold),
        ),
        leading: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: IconButton(
            icon: const Icon(Icons.chevron_left),
            onPressed: () {
              Routefly.navigate(routePaths.auth.login.path);
            },
          ),
        ),
      ),
      body: SafeArea(
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Form(
              key: controller.formKey,
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Nova senha',
                      style: textTheme.titleMedium?.copyWith(
                          color: colorsTheme.textColor, fontSize: 14),
                    ),
                    const SizedBox(height: 8),
                    PasswordTextFormField(
                      controller: controller.newPasswordController,
                      hitText: 'Nova senha',
                      validator: controller.passwordValidator,
                    ),
                    const SizedBox(height: 24),
                    Text(
                      'Confirmar nova senha',
                      style: textTheme.titleMedium?.copyWith(
                          color: colorsTheme.textColor, fontSize: 14),
                    ),
                    const SizedBox(height: 8),
                    PasswordTextFormField(
                      controller: controller.confirmNewPasswordController,
                      hitText: 'Confirmar nova senha',
                      validator: controller.repeatPasswordValidator,
                    ),
                    const SizedBox(height: 24),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 16.0),
              child: CooButton.primary(
                label: 'Concluir',
                onPressed: () => _reset(),
                size: const Size(double.infinity, 50),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
