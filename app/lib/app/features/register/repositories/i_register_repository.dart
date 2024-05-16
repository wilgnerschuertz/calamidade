import 'package:coopartilhar/app/features/auth/entities/user_entity.dart';
import 'package:coopartilhar/app/features/register/entities/register_entity.dart';
import 'package:core_module/core_module.dart';

abstract class IRegisterRepository {
  Future<Output<RegisterEntity>> register({
    required RegisterEntity register,
  });
  Future<Output<UserEntity>> getUser({
    required String document,
  });
}
