import 'package:core_module/src/entities/auth/credencial_entity.dart';

class CredentialsAdapter {
  static Map<String, dynamic> toMap({
    required CredentialsEntity credentials,
  }) {
    return {
      'email': credentials.email,
      'password': credentials.password,
    };
  }
}
