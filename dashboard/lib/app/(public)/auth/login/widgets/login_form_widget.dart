import 'package:dashboard/app/features/auth/interactor/controllers/login_controller.dart';
import 'package:dashboard/app/features/auth/interactor/states/login_states.dart';

import 'package:flutter/material.dart';
import 'package:design_system/design_system.dart';
import 'package:core_module/core_module.dart';
import 'package:dashboard/app/(public)/auth/login/widgets/password_text_form_field_widget.dart';

import 'package:dashboard/app/features/auth/interactor/value_objects/email_vo.dart';
import 'package:dashboard/app/features/auth/interactor/value_objects/password_vo.dart';
import 'package:dashboard/injector.dart';

class LoginFormWidget extends StatefulWidget {
  const LoginFormWidget({super.key});

  @override
  State<LoginFormWidget> createState() => _LoginFormWidgetState();
}

class _LoginFormWidgetState extends State<LoginFormWidget> {
  final controller = injector.get<LoginController>();

  @override
  void initState() {
    controller.addListener(listener);
    super.initState();
  }

  void listener() {
    return switch (controller.value) {
      ErrorState(:final exception) =>
        Alerts.showFailure(context, exception.message),
      LoginSuccess() => Routefly.pushNavigate('/home/new_requests'),
      _ => null,
    };
  }

  @override
  void dispose() {
    controller.dispose();
    controller.removeListener(listener);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colors = CoopartilharColors.of(context);
    final labelStyle = Theme.of(context)
        .textTheme
        .labelSmall!
        .copyWith(fontSize: 13, fontWeight: FontWeight.normal);
    return Container(
      decoration: BoxDecoration(
        image: const DecorationImage(
          image: CooImages.cooBackgroundDetails,
          alignment: Alignment.bottomCenter,
        ),
        borderRadius: const BorderRadius.only(
            topRight: Radius.circular(16), bottomRight: Radius.circular(16)),
        color: colors.white,
      ),
      child: Center(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 406),
          child: Form(
            key: controller.formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Login',
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge!
                      .copyWith(fontSize: 30),
                ),
                const SizedBox(height: 20),
                Text('E-mail', style: labelStyle),
                const SizedBox(height: 4),
                TextFormField(
                  controller: controller.emailController,
                  decoration:
                      const InputDecoration(hintText: 'Insira seu email'),
                  validator: (value) => EmailVO(value: value).validate(),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Senha', style: labelStyle),
                    Text('Esqueci minha senha', style: labelStyle),
                  ],
                ),
                const SizedBox(height: 4),
                PasswordTextFormFieldWidget(
                  controller: controller.passwordController,
                  hitText: 'Insira sua senha',
                  validator: (value) => PasswordVO(value: value).validate(),
                ),
                const SizedBox(height: 30),
                ValueListenableBuilder(
                  valueListenable: controller,
                  builder: (_, state, child) {
                    if (state is LoadingState) {
                      return const Center(child: CircularProgressIndicator());
                    }

                    return CooButton.primary(
                      label: 'Entrar',
                      onPressed: controller.login,
                      size: const Size(double.infinity, 48),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
