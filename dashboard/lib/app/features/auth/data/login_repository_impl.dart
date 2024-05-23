import 'package:core_module/core_module.dart';

import 'package:dashboard/app/features/auth/interactor/repositories/login_repository.dart';

class LoginRepositoryImpl implements LoginRepository {
  const LoginRepositoryImpl({
    required this.client,
  });

  final IRestClient client;

  @override
  Future<Output<SessionEntity>> login({
    required CredentialsEntity credentials,
  }) async {
    const loginUrl = '/core/v1/auth/email/login';

    try {
      final response = await client.post(
        RestClientRequest(
          path: loginUrl,
          data: SessionAdapter.toJson(credentials: credentials),
        ),
      );

      return Right(SessionAdapter.fromJson(response.data));
    } on BaseException catch (err) {
      if (err.data['erros']['email'] == 'emailNotExists') {
        return const Left(
            DefaultException(message: 'E-mail não foi encontrado'));
      }

      if (err.data['erros']['password'] == 'incorrectPassword') {
        return const Left(DefaultException(message: 'Senha incorreta'));
      }
      return Left(DefaultException(message: err.message));
    } catch (_) {
      return const Left(DefaultException(message: 'Erro desconhecido'));
    }
  }
}
