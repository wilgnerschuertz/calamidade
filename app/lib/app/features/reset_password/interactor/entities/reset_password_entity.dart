import 'package:core_module/core_module.dart';

class ResetPasswordEntity extends Entity {
  final String password;
  final int hash;

  ResetPasswordEntity(
    super.id, {
    required this.password,
    required this.hash,
  });
}
