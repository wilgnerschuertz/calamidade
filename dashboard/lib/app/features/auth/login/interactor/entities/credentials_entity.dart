import 'package:core_module/core_module.dart';

class CredentialsEntity extends Entity {
  final String email;
  final String password;
  CredentialsEntity(
    super.id,
    this.email,
    this.password,
  );
}
