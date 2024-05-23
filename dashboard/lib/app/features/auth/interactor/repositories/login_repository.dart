import 'package:core_module/core_module.dart';

abstract class LoginRepository {
  Future<Output<SessionEntity>> login({
    required CredentialsEntity credentials,
  });
}
