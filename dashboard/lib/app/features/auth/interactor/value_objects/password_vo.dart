import 'package:core_module/core_module.dart';
import 'package:dashboard/app/features/auth/interactor/value_objects/i_value_object.dart';

class PasswordVO extends IValueObject {
  PasswordVO({
    required super.value,
  });

  @override
  String? validate() {
    if (ValidatorsHelper.passwordIsEmpty(value)) {
      return 'A senha não pode ser vazia.';
    }
    return ValidatorsHelper.passworHasEnoughCharacters(value)
        ? null
        : 'Insira uma senha com pelo menos 4 caracteres.';
  }
}
