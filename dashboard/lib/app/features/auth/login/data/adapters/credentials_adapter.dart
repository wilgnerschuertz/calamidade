import 'package:dashboard/app/features/auth/login/interactor/entities/credentials_entity.dart';

class CredentialsAdapter {
  static Map<String, dynamic> toMap(CredentialsEntity credentials) {
    return {
      'email': credentials.email,
      'password': credentials.password,
    };
  }
}
