import 'package:coopartilhar/app/features/check_affiliated/data/adapters/check_affiliated_adapter.dart';
import 'package:coopartilhar/app/features/check_affiliated/data/i_check_affiliated_repository.dart';
import 'package:coopartilhar/app/features/check_affiliated/entities/check_affiliated_entity.dart';
import 'package:core_module/core_module.dart';

class CheckAffiliatedController extends BaseController {
  final ICheckAffiliatedRepository repository;
  final ICache cache;

  CheckAffiliatedController({required this.repository, required this.cache})
      : super(InitialState());

  Future<void> check({required String document}) async {
    update(LoadingState());

    final response = await repository.check(document);

    response.fold(
      (l) => update(ErrorState(exception: l)),
      (r) {
        cache.setData(
          params: CacheParams(
            key: 'user',
            value: CheckAffiliatedAdapter.toJson(r),
          ),
        );
        update(SuccessState<CheckAffiliatedEntity>(data: r));
      },
    );
  }
}
