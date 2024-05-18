import 'package:coopartilhar/app/features/auth/interactor/entities/credentials_entity.dart';
import 'package:coopartilhar/app/features/auth/interactor/entities/session_entity.dart';
import 'package:core_module/core_module.dart';

abstract class IAuthRepository {
  Future<Output<SessionEntity>> login({required CredentialsEntity credentials});
}
