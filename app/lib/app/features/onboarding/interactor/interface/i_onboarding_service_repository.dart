import 'package:coopartilhar/app/features/onboarding/interactor/entities/onboarding_entity.dart';
import 'package:core_module/core_module.dart';

abstract class IOnboardingServiceRepository {
  Future<Output<OnboardingEntity>> getOnboardingData();
}
