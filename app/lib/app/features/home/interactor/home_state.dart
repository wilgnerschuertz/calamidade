import 'package:coopartilhar/app/features/home/interactor/order_entity.dart';
import 'package:core_module/core_module.dart';

final class HomeInitial implements InitialState {}

final class HomeLoading implements LoadingState {}

final class HomeError<T extends BaseException> implements ErrorState {
  @override
  final T exception;
  HomeError(this.exception);
}

final class HomeSuccess implements SuccessState {
  @override
  final List<OrderEntity> data;
  const HomeSuccess({required this.data});
}
