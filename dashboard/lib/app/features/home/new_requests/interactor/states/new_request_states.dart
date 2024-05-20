import 'package:core_module/core_module.dart';
import 'package:dashboard/app/features/home/new_requests/interactor/entities/new_request_entity.dart';

class NewRequestsInitialState implements InitialState {}

class NewRequestsLoadingState implements LoadingState {}

class NewRequestsErrorState extends ErrorState {
  const NewRequestsErrorState({required super.exception});
}

class NewRequestsSuccessState extends SuccessState<List<NewRequestEntity>> {
  const NewRequestsSuccessState({
    required super.data,
    this.selectedId,
    this.lastItem,
  });

  final int? selectedId;
  final NewRequestEntity? lastItem;

  NewRequestsSuccessState copyWith(
      {List<NewRequestEntity>? data,
      int? selectedId,
      NewRequestEntity? lastItem}) {
    return NewRequestsSuccessState(
      data: data ?? this.data,
      selectedId: selectedId ?? this.selectedId,
      lastItem: lastItem ?? this.lastItem,
    );
  }
}
