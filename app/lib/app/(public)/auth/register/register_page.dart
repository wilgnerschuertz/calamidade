import 'package:coopartilhar/app/(public)/auth/register/non_editable_register_item.dart';
import 'package:coopartilhar/app/(public)/auth/register/register_item_field.dart';
import 'package:coopartilhar/app/features/register/interactor/controllers/register_controller.dart';
import 'package:coopartilhar/injector.dart';
import 'package:coopartilhar/routes.dart';
import 'package:core_module/core_module.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  RegisterPage({super.key})
      : document = Routefly.query.arguments.document.toString(),
        name = Routefly.query.arguments.name,
        email = Routefly.query.arguments.email,
        phone = Routefly.query.arguments.phone;

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
      SuccessState() => Routefly.navigate(routePaths.affiliatedFirstAction.presentation.affiliatedFirstAction),
      ErrorState(:final exception) => Alerts.showFailure(context, exception.message),
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
    final Size size = MediaQuery.sizeOf(context);
    final keybordHeight = MediaQuery.of(context).viewInsets.bottom;

    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Text(
          'Concluir cadastro',
          style: textTheme.displayLarge?.copyWith(color: colors.textColor),
        ),
        leading: IconButton(
          icon: const Icon(Icons.chevron_left),
          onPressed: Navigator.of(context).pop,
        ),
        surfaceTintColor: Colors.transparent,
      ),
      resizeToAvoidBottomInset: false,
      body: Container(
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
              return SingleChildScrollView(
                padding: EdgeInsets.only(bottom: keybordHeight),
                child: Form(
                  key: controller.formKey,
                  child: SizedBox(
                    height: size.height - kToolbarHeight,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
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
                          controller: controller.repeatPasswordController,
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
              );
            },
          ),
        ),
      ),
    );
  }
}
