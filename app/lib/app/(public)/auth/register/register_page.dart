import 'package:coopartilhar/app/(public)/auth/register/non_editable_register_item.dart';
import 'package:coopartilhar/app/(public)/auth/register/register_item_field.dart';
import 'package:coopartilhar/app/features/register/interactor/controllers/register_controller.dart';
import 'package:coopartilhar/injector.dart';
import 'package:core_module/core_module.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  RegisterPage({super.key})
      : document = Routefly.query.arguments.document.toString(),
        name = Routefly.query.arguments.name;
  final String document;
  final String name;

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final controller = injector.get<RegisterController>();

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colors = CoopartilharColors.of(context);
    final textTheme = Theme.of(context).textTheme;
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
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: ValueListenableBuilder(
            valueListenable: controller,
            builder: (context, value, child) {
              if (controller.value is LoadingState) {
                return const Center(child: CircularProgressIndicator());
              }
              return Form(
                key: controller.formKey,
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
                      title: 'Informe o seu CPF/CNPJ',
                      value: widget.document,
                    ),
                    const SizedBox(height: 30),
                    RegisterItemField(
                      title: 'E-mail',
                      controller: controller.emailController,
                      hint: 'Insira o e-mail',
                      validator: controller.emailValidator,
                    ),
                    const SizedBox(height: 20),
                    Row(
                      children: [
                        Expanded(
                          child: RegisterItemField(
                            title: 'Senha',
                            controller: controller.passwordController,
                            hint: 'Insira a senha',
                            validator: controller.passwordValidator,
                          ),
                        ),
                        const SizedBox(width: 5),
                        Expanded(
                          child: RegisterItemField(
                            title: 'Senha',
                            hint: 'Repetir a senha',
                            controller: controller.repeatPasswordController,
                            validator: controller.repeatPasswordValidator,
                          ),
                        ),
                      ],
                    ),
                    const Spacer(),
                    CooButton.primary(
                      label: 'Entrar',
                      onPressed: () => controller.register(
                        document: widget.document,
                        name: widget.name,
                      ),
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              );
            }),
      ),
    );
  }
}
