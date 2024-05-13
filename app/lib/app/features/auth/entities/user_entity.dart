import 'package:app/app/core/entities/entity.dart';

class UserEntity extends Entity {
  final String email;
  final String name;

  UserEntity(super.id, this.email, this.name);
}
