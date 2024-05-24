import '../../entities/auth/credencial_entity.dart';
import '../../entities/auth/session_entity.dart';
import 'user_adapter.dart';

class SessionAdapter {
  static Map<String, dynamic> toJson({
    required CredentialsEntity credentials,
  }) {
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
