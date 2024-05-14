import 'package:app/app/core/errors/errors.dart';

sealed class DefaultState {}

class InitialState implements DefaultState {}

class LoadingState implements DefaultState {}

class SuccessState<R> implements DefaultState {
  const SuccessState({
    required this.data,
  });

  final R data;
}

class ErrorState<T extends BaseException> implements DefaultState {
  const ErrorState({
    required this.exception,
  });

  final T exception;
}
