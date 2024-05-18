import 'package:coopartilhar/app/features/check_affiliated/entities/check_affiliated_entity.dart';
import 'package:core_module/core_module.dart';

class CheckAffiliatedAdapter {
  static CheckAffiliatedEntity fromJson(Map<String, dynamic> json) {
    return CheckAffiliatedEntity(
      json['id'] ?? const Uuid().v8(),
      name: json['name'],
      document: json['document'],
      email: json['email'],
      phone: json['phone'],
    );
  }

  static Map<String, dynamic> toJson(CheckAffiliatedEntity value) {
    return {
      'name': value.name,
      'document': value.document,
      'email': value.email,
      'phone': value.phone,
    };
  }
}
