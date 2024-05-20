import 'package:core_module/core_module.dart';
import 'package:dashboard/app/features/auth/login/interactor/entities/credentials_entity.dart';
import 'package:dashboard/app/features/auth/login/interactor/interface/i_login_repository.dart';

class LoginRepositoryImpl implements ILoginRepository {
  @override
  Future<Output<Unit>> auth(CredentialsEntity credentials) async {
    return const Right(unit);
  }
}
