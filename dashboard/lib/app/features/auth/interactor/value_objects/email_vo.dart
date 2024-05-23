import 'package:core_module/core_module.dart';
import 'package:dashboard/app/features/auth/interactor/value_objects/i_value_object.dart';

class EmailVO extends IValueObject {
  EmailVO({
    required super.value,
  });

  @override
  String? validate() {
    if (ValidatorsHelper.emailIsEmpty(value)) {
      return 'O email não pode ser vazio.';
    }
    return !ValidatorsHelper.emailIsValid(value)
        ? 'O email não é válido.'
        : null;
  }
}
