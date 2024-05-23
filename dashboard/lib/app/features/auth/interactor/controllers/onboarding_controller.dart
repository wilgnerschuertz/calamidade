import 'package:core_module/core_module.dart';
import 'package:dashboard/app/features/auth/interactor/entities/onboarding_entity.dart';
import 'package:dashboard/app/features/auth/interactor/interface/i_onboarding_repository.dart';

class OnboardingController extends BaseController<BaseState> {
  final IOnboardingRepository onboardingRepository;
  OnboardingController(
    this.onboardingRepository,
  ) : super(InitialState());

  Future<void> getOnboardingData() async {
    update(LoadingState());
    final result = await onboardingRepository.getOnboardingData();
    result.fold(
      (left) => update(ErrorState(exception: left)),
      (right) => update(SuccessState<OnboardingEntity>(data: right)),
    );
  }
}
