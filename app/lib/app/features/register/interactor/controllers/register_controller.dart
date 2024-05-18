import 'package:coopartilhar/app/features/register/entities/register_entity.dart';
import 'package:coopartilhar/app/features/register/data/repositories/i_register_repository.dart';
import 'package:core_module/core_module.dart';
import 'package:flutter/material.dart';

class RegisterController<RegisterState> extends BaseController {
  RegisterController({required this.repository}) : super(InitialState());
  final IRegisterRepository repository;

  late final passwordController = TextEditingController();
  late final repeatPasswordController = TextEditingController();
  late final formKey = GlobalKey<FormState>();

  Future<void> register({
    required String name,
    required String document,
    required String email,
  }) async {
    if (formKey.currentState!.validate()) {
      final registerEntity = RegisterEntity(
        const Uuid().v4(),
        email: email,
        name: name,
        document: document,
        password: passwordController.text,
      );

      update(LoadingState());

      final response = await repository.register(register: registerEntity);

      response.fold(
        (left) => update(ErrorState(exception: left)),
        (right) => update(SuccessState<Unit>(data: right)),
      );
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
    passwordController.dispose();
    repeatPasswordController.dispose();
  }
}
