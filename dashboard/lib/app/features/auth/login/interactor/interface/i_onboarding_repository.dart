import 'package:core_module/core_module.dart';
import 'package:dashboard/app/features/auth/login/interactor/entities/onboarding_entity.dart';

abstract class IOnboardingRepository {
  Future<Output<OnboardingEntity>> getOnboardingData();
}
