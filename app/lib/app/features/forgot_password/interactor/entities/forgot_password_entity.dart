import 'package:core_module/core_module.dart';

class ForgotPasswordEntity extends Entity {
  final String email;

  ForgotPasswordEntity(
    super.id, {
    required this.email,
  });
}
