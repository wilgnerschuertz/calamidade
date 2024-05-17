import 'package:coopartilhar/app/features/onboarding/data/adapter/onboarding_adpter.dart';
import 'package:coopartilhar/app/features/onboarding/interactor/entities/onboarding_entity.dart';
import 'package:coopartilhar/app/features/onboarding/interactor/interface/i_onboarding_repository.dart';
import 'package:core_module/core_module.dart';

class OnboardingRepositoryImpl implements IOnboardingRepository {
  final IRestClient restClient;

  OnboardingRepositoryImpl(this.restClient);

  @override
  Future<Output<OnboardingEntity>> getOnboardingData() async {
    try {
      // TODO, rever backend endpoint
      const url = '';
      final response = await restClient.get(RestClientRequest(path: url));
      if (response.data == null) {
        return const Left(DefaultException(message: 'Requisição inválida'));
      }

      return Right(OnboardingAdpter.fromJson(response.data!));
    } on BaseException catch (err) {
      return Left(DefaultException(message: err.message));
    } catch (_) {
      return const Left(DefaultException(message: 'Erro desconhecido'));
    }
  }
}
