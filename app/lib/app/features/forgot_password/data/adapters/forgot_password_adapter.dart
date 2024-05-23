
import 'package:coopartilhar/app/features/forgot_password/interactor/entities/forgot_password_entity.dart';

class ForgotPasswordAdapter {
  static Map<String, dynamic> toJson(ForgotPasswordEntity forgotEntity) {
    return {
      'email': forgotEntity.email,
    };
  }
}
