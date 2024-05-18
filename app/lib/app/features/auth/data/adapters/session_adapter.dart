import 'package:coopartilhar/app/features/auth/data/adapters/user_adapter.dart';
import 'package:coopartilhar/app/features/auth/interactor/entities/credentials_entity.dart';
import 'package:coopartilhar/app/features/auth/interactor/entities/session_entity.dart';
import 'package:core_module/core_module.dart';

class SessionAdapter {
  static Map<String, dynamic> toJson(CredentialsEntity credentials) {
    return {
      'email': credentials.email,
      'password': credentials.password,
    };
  }

  static SessionEntity fromJson(Map<String, dynamic> data) {
    // TODO: Back-end não retorna os campos de nome e photo

    return SessionEntity(
      data['id'] ?? -1,
      token: data['token'],
      refreshToken: data['refreshToken'],
      tokenExpires: data['tokenExpires'],
      user: UserAdapter.fromJson(data['user']),
    );
  }
}
