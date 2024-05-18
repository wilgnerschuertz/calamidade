import 'package:coopartilhar/app/features/auth/interactor/entities/user_entity.dart';
import 'package:core_module/core_module.dart';

class UserAdapter {
  static UserEntity fromJson(Map<String, dynamic> data) {
    return UserEntity(
      data['id'] ?? const Uuid(),
      name: data['name'] ?? '',
      email: data['email'] ?? '',
      urlAvatar: data['phono'] ?? '',
    );
  }
}
