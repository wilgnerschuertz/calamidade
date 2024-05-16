import 'package:coopartilhar/app/features/auth/entities/user_entity.dart';
import 'package:coopartilhar/app/features/register/repositories/i_register_repository.dart';
import 'package:core_module/core_module.dart';

import 'package:coopartilhar/app/features/register/entities/register_entity.dart';
import 'package:flutter/material.dart';

class RegisterController<RegisterState> extends BaseController {
  RegisterController({required this.repository}) : super(InitialState());

  final IRegisterRepository repository;

  late final emailController = TextEditingController();
  late final passwordController = TextEditingController();
  late final repeatPasswordController = TextEditingController();
  late final formKey = GlobalKey<FormState>();

  Future<void> init(String document) => getUser(document);

  Future<void> getUser(String document) async {
    update(LoadingState());
    final response = await repository.getUser(document: document);
    response.fold(
      (left) => update(ErrorState(exception: left)),
      (right) => update(SuccessState<UserEntity>(data: right)),
    );
  }

  Future<void> register() async {
    if (formKey.currentState!.validate()) {
      String? name;
      if (state case final SuccessState<UserEntity> user) {
        name = user.data.name;
      }

      update(LoadingState());

      final response = await repository.register(
        register: RegisterEntity(
          const Uuid().v4(),
          email: emailController.text,
          name: name ?? '',
          document: document,
          password: password,
        ),
      );

      response.fold(
        (left) => update(ErrorState(exception: left)),
        (right) => update(SuccessState<RegisterEntity>(data: right)),
      );
    }
  }

  String? emailValidator(String? text) {
    if (ValidatorsHelper.emailIsEmpty(text)) {
      return 'O e-mail não pode estar vazio';
    } else {
      return ValidatorsHelper.emailIsValid(text) ? null : 'E-mail inválido';
    }
  }

  String? passwordValidator(String? text) {
    if (ValidatorsHelper.passwordIsEmpty(text)) {
      return 'A senha não pode estar vazia';
    } else {
      return ValidatorsHelper.passworHasEnoughCharacters(text)
          ? null
          : 'Insira uma senha com pelo menos 4 caracteres';
    }
  }

  String? repeatPasswordValidator(String? text) {
    if (ValidatorsHelper.passwordIsEmpty(text)) {
      return 'A senha não pode estar vazia';
    } else if (passwordController.text.isNotEmpty &&
        text != passwordController.text) {
      return 'As senhas devem ser iguais';
    }
    return null;
  }

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
    repeatPasswordController.dispose();
  }
}
