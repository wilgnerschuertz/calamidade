import 'package:coopartilhar/app/features/onboarding/interactor/exceptions/onboarding_exception.dart';
import 'package:core_module/core_module.dart';

class OnboardingInitialState extends InitialState {}

class OnboardingLoadingState extends LoadingState {}

class OnboardingSuccsessState extends SuccessState<String> {
  const OnboardingSuccsessState({
    required super.data,
  });
}

class OnboardingErrorState extends ErrorState<OnboardindException> {
  OnboardingErrorState({
    required super.exception,
  });
}
