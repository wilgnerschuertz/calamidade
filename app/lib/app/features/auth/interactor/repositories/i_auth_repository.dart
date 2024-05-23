import 'package:core_module/core_module.dart';

abstract class IAuthRepository {
  Future<Output<SessionEntity>> login({required CredentialsEntity credentials});
}
