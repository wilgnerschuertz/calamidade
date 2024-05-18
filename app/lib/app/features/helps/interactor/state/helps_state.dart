import 'package:coopartilhar/app/features/helps/interactor/entities/helps_entity.dart';
import 'package:core_module/core_module.dart';

final class HelpsInitial implements InitialState {}

final class HelpsLoading implements LoadingState {}

final class HelpsError extends ErrorState {
  const HelpsError({required super.exception});
}

final class HelpsSuccess extends SuccessState<HelpsEntity> {
  const HelpsSuccess({required super.data});
}
