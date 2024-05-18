import 'package:coopartilhar/app/features/auth/data/adapters/session_adapter.dart';
import 'package:coopartilhar/app/features/auth/interactor/entities/session_entity.dart';
import 'package:coopartilhar/app/features/auth/interactor/repositories/i_auth_repository.dart';
import 'package:coopartilhar/app/features/auth/interactor/entities/credentials_entity.dart';
import 'package:core_module/core_module.dart';

class AuthRepositoryImpl implements IAuthRepository {
  const AuthRepositoryImpl({
    required this.client,
  });

  final IRestClient client;

  @override
  Future<Output<SessionEntity>> login({required CredentialsEntity credentials}) async {
    try {
      final response = await client.post(
        RestClientRequest(
          path: '/core/v1/auth/email/login',
          data: SessionAdapter.toJson(credentials),
        ),
      );

      return Right(SessionAdapter.fromJson(response.data));
    } on BaseException catch (err) {
      return Left(DefaultException(message: err.message));
    } catch (_) {
      return const Left(DefaultException(message: 'Erro desconhecido'));
    }
  }
}
