import 'package:core_module/core_module.dart';

class UserEntity extends Entity {
  UserEntity({
    required int id,
    required this.email,
    required this.name,
  }) : super(id);

  final String email;
  final String name;
}
