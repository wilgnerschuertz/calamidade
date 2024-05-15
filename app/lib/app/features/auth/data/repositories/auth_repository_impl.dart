import 'package:coopartilhar/app/features/auth/data/repositories/i_auth_repository.dart';
import 'package:coopartilhar/app/features/auth/entities/credentials_entity.dart';
import 'package:core_module/core_module.dart';

class AuthRepositoryImpl implements IAuthRepository {
  const AuthRepositoryImpl({
    required IRestClient client,
  }) : _client = client;

  final IRestClient _client;

  @override
  Future<Output<Either>> login({required CredentialsEntity credentials}) {
    // TODO: implement login
    throw UnimplementedError();
  }
}
