import 'package:core_module/core_module.dart';

class UserEntity extends Entity {
  final String email;
  final String name;
  final String urlAvatar;

  UserEntity(
    super.id, {
    required this.email,
    required this.name,
    required this.urlAvatar,
  });
}
