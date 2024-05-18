import 'package:core_module/core_module.dart';
import 'package:dashboard/app/features/home/new_requests/interactor/entities/new_request_entity.dart';

class LoadingNewRequestStates implements BaseState {}

final class NewRequestInitialState implements InitialState {}

final class NewRequestLoadingState implements LoadingState {}

final class NewRequestErrorState extends ErrorState {
  const NewRequestErrorState({required super.exception});
}

final class NewRequestSuccessState
    extends SuccessState<List<NewRequestEntity>> {
  const NewRequestSuccessState({required super.data});
}
