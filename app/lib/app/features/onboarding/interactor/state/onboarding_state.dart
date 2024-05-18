import 'package:coopartilhar/app/features/onboarding/interactor/entities/onboarding_entity.dart';
import 'package:core_module/core_module.dart';

class OnboardingInitialState extends InitialState {}

class OnboardingLoadingState extends LoadingState {}

class OnboardingSuccessState extends SuccessState<OnboardingEntity> {
  const OnboardingSuccessState({
    required super.data,
  });
}

class OnboardingErrorState<OnboardingException extends BaseException> extends ErrorState {
  const OnboardingErrorState(
    this.onboardingException,
  ) : super(exception: onboardingException);

  final OnboardingException onboardingException;
}
