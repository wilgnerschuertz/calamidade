import 'package:core_module/core_module.dart';
import 'package:dashboard/app/features/auth/login/interactor/entities/credentials_entity.dart';

abstract class ILoginRepository {
  Future<Output<Unit>> auth(CredentialsEntity credentials);
}
