import 'package:coopartilhar/app/features/reset_password/interactor/entities/reset_password_entity.dart';

class ResetPasswordAdapter {
  static Map<String, dynamic> toJson(ResetPasswordEntity resetEntity) {
    return {
      'password': resetEntity.password,
      'hash': resetEntity.hash,
    };
  }
}
