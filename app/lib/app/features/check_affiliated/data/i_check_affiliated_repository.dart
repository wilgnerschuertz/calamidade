import 'package:coopartilhar/app/features/auth/interactor/entities/user_entity.dart';
import 'package:core_module/core_module.dart';

abstract class ICheckAffiliatedRepository {
  Future<Output<UserEntity>> check(String document);
}
