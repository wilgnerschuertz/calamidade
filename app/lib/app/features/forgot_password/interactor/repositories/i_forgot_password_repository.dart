import 'package:coopartilhar/app/features/forgot_password/interactor/entities/forgot_password_entity.dart';
import 'package:core_module/core_module.dart';

abstract class IForgotPasswordRepository {
  Future<Output<Unit>> sendEmailPass({
    required ForgotPasswordEntity forgotEntity,
  });
}
