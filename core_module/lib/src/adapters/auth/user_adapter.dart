import '../../entities/auth/user_entity.dart';

class UserAdapter {
  static UserEntity fromJson(Map<String, dynamic> data) {
    return UserEntity(
      data['id'] ?? -1,
      name: data['name'] ?? '',
      email: data['email'] ?? '',
      phone: data['phone'] ?? '',
      document: data['document'] ?? '',
    );
  }

  static Map<String, dynamic> toJson(UserEntity user) {
    return {
      'id': user.id,
      'name': user.name,
      'email': user.email,
      'phone': user.phone,
      'document': user.document
    };
  }
}
