import 'package:core_module/core_module.dart';

class SessionEntity extends Entity {
  final String token;
  final String refreshToken;
  final int tokenExpires;
  final UserEntity user;

  SessionEntity(
    super.id, {
    required this.token,
    required this.refreshToken,
    required this.tokenExpires,
    required this.user,
  });
}
