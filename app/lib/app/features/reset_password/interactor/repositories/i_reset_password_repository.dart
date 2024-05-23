import 'package:coopartilhar/app/features/reset_password/interactor/entities/reset_password_entity.dart';
import 'package:core_module/core_module.dart';

abstract class IResetPasswordRepository {
  Future<Output<Unit>> resetPassword({
    required ResetPasswordEntity resetEntity,
  });
}
