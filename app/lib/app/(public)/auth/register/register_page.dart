import 'package:coopartilhar/app/(public)/auth/register/widgets/non_editable_register_item.dart';
import 'package:coopartilhar/app/(public)/auth/register/widgets/register_item_field.dart';
import 'package:coopartilhar/app/features/register/interactor/controllers/register_controller.dart';
import 'package:coopartilhar/injector.dart';
import 'package:coopartilhar/routes.dart';
import 'package:core_module/core_module.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  RegisterPage({super.key})
      : document = Routefly.query.arguments.document.document,
        name = Routefly.query.arguments.document.name,
        email = Routefly.query.arguments.document.email,
        phone = Routefly.query.arguments.document.phone;

  final String document;
  final String name;
  final String email;
  final String phone;

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final controller = injector.get<RegisterController>();

  @override
  void initState() {
    super.initState();
    controller.addListener(listener);
  }

  void listener() {
    return switch (controller.value) {
      SuccessState() => Routefly.navigate(
          routePaths.affiliatedFirstAction.presentation.affiliatedFirstAction),
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
    final colors = CoopartilharColors.of(context);
    final textTheme = Theme.of(context).textTheme;
    final keyboardHeight = MediaQuery.of(context).viewInsets.bottom;

    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Text(
          'Concluir cadastro',
          style: textTheme.displayLarge?.copyWith(color: colors.textColor),
        ),
        leading: IconButton(
          icon: Icon(UIcons.regularStraight.angle_small_left),
          onPressed: Navigator.of(context).pop,
        ),
        surfaceTintColor: Colors.transparent,
      ),
      resizeToAvoidBottomInset: false,
      body: LayoutBuilder(builder: (context, constraints) {
        return Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: CooImages.cooBackgroundDetails,
              fit: BoxFit.contain,
              alignment: Alignment.bottomCenter,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: ValueListenableBuilder(
              valueListenable: controller,
              builder: (context, value, child) {
                if (controller.value is LoadingState) {
                  return const Center(child: CircularProgressIndicator());
                }
                return Column(
                  children: [
                    Expanded(
                      child: SingleChildScrollView(
                        child: SizedBox(
                          height: constraints.maxHeight,
                          child: Form(
                            key: controller.formKey,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: keyboardHeight > 0
                                  ? MainAxisAlignment.start
                                  : MainAxisAlignment.spaceBetween,
                              children: [
                                const SizedBox(height: 30),
                                NonEditableRegisterItem(
                                  title: 'Nome completo',
                                  value: widget.name,
                                ),
                                const SizedBox(height: 30),
                                NonEditableRegisterItem(
                                  title: 'CPF/CNPJ',
                                  value: widget.document,
                                ),
                                const SizedBox(height: 30),
                                NonEditableRegisterItem(
                                  title: 'E-mail',
                                  value: widget.email,
                                ),
                                const SizedBox(height: 30),
                                NonEditableRegisterItem(
                                  title: 'Telefone',
                                  value: widget.phone,
                                ),
                                const SizedBox(height: 30),
                                RegisterItemField(
                                  title: 'Senha',
                                  controller: controller.passwordController,
                                  hint: 'Insira sua senha',
                                  isPassword: true,
                                  validator: controller.passwordValidator,
                                ),
                                const SizedBox(height: 30),
                                RegisterItemField(
                                  title: 'Confirmar senha',
                                  controller:
                                      controller.repeatPasswordController,
                                  hint: 'Insira novamente sua senha',
                                  isPassword: true,
                                  validator: controller.repeatPasswordValidator,
                                ),
                                const Spacer(),
                                CooButton.primary(
                                  label: 'Entrar',
                                  onPressed: () => controller.register(
                                    document: widget.document,
                                    name: widget.name,
                                    email: widget.email,
                                  ),
                                ),
                                const SizedBox(height: 40),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: keyboardHeight,
                    )
                  ],
                );
              },
            ),
          ),
        );
      }),
    );
  }
}
