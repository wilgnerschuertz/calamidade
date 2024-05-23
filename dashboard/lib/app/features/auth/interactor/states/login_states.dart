import 'package:core_module/core_module.dart';

final class LoginInitial implements InitialState {}

final class LoginLoading implements LoadingState {}

final class LoginError extends ErrorState {
  const LoginError({required super.exception});
}

final class LoginSuccess extends SuccessState<UserEntity> {
  const LoginSuccess({
    required super.data,
  });
}
