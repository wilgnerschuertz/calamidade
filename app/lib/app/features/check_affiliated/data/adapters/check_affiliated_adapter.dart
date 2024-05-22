import 'package:core_module/src/entities/auth/user_entity.dart';

class CheckAffiliatedAdapter {
  static UserEntity fromJson(Map<String, dynamic> json) {
    return UserEntity(
      json['id'] ?? -1,
      name: json['name'] ?? '',
      document: json['document'] ?? '',
      email: json['email'] ?? '',
      phone: json['phone'] ?? '',
    );
  }

  static Map<String, dynamic> toJson(UserEntity value) {
    return {
      'name': value.name,
      'document': value.document,
      'email': value.email,
      'phone': value.phone,
    };
  }
}
