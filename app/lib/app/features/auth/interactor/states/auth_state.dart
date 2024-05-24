import 'package:core_module/core_module.dart';

final class AuthInitial implements InitialState {}

final class AuthNotLogged implements BaseState {}

final class AuthLoading implements LoadingState {}

final class AuthError extends ErrorState {
  const AuthError({required super.exception});
}

final class AuthSuccess extends SuccessState<UserEntity> {
  const AuthSuccess({required super.data});
}
