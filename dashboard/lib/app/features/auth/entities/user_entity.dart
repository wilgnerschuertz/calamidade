import 'package:core_module/core_module.dart';

class UserEntity extends Entity {
  final String email;
  final String name;

  UserEntity(super.id, this.email, this.name);
}
