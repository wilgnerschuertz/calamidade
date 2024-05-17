import 'dart:convert';
import 'package:dashboard/app/features/auth/login/interactor/entities/credentials_entity.dart';

class CredentialsAdapter {
  static String toJson(CredentialsEntity credentials) {
    final Map<String, dynamic> jsonMap = {
      'email': credentials.email,
      'password': credentials.password,
    };
    return jsonEncode(jsonMap);
  }
}
