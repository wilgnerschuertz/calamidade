import 'package:coopartilhar/app/features/address/interactor/states/address_states.dart';
import 'package:coopartilhar/app/features/reset_password/interactor/entities/reset_password_entity.dart';
import 'package:coopartilhar/app/features/reset_password/interactor/repositories/i_reset_password_repository.dart';
import 'package:core_module/core_module.dart';
import 'package:flutter/widgets.dart';

class ResetPasswordController extends BaseController {
  final IResetPasswordRepository _repository;

  late final TextEditingController newPasswordController = TextEditingController();
  late final TextEditingController confirmNewPasswordController = TextEditingController();
  late final formKey = GlobalKey<FormState>();

  ResetPasswordController(this._repository) : super(InitialState());

  Future<void> resetPassword() async {
    update(AddressLoadingState());

    final ResetPasswordEntity resetEntity = ResetPasswordEntity(
      -1,
      password: newPasswordController.text,
      hash: newPasswordController.text.hashCode,
    );

    final response = await _repository.resetPassword(resetEntity: resetEntity);

    response.fold(
      (error) => update(ErrorState<BaseException>(exception: error)),
      (data) => update(SuccessState(data: data)),
    );
  }

  String? passwordValidator(String? text) {
    if (ValidatorsHelper.passwordIsEmpty(text)) {
      return 'A senha não pode estar vazia';
    } else {
      return ValidatorsHelper.passworHasEnoughCharacters(text) ? null : 'Insira uma senha com pelo menos 4 caracteres';
    }
  }

  String? repeatPasswordValidator(String? text) {
    if (ValidatorsHelper.passwordIsEmpty(text)) {
      return 'A senha não pode estar vazia';
    } else if (newPasswordController.text.isNotEmpty && text != newPasswordController.text) {
      return 'As senhas devem ser iguais';
    }
    return null;
  }
}
