import 'package:core_module/core_module.dart';

class NewRequestsInitialState implements InitialState {}

class NewRequestsLoadingState implements LoadingState {}

class NewRequestsErrorState extends ErrorState {
  const NewRequestsErrorState({
    required super.exception,
  });
}

class NewRequestsSuccessState extends SuccessState<List<RequestEntity>> {
  const NewRequestsSuccessState({
    required super.data,
    this.selectedId,
    this.lastItem,
  });

  final int? selectedId;
  final RequestEntity? lastItem;

  NewRequestsSuccessState copyWith({
    List<RequestEntity>? data,
    int? selectedId,
    RequestEntity? lastItem,
  }) {
    return NewRequestsSuccessState(
      data: data ?? this.data,
      selectedId: selectedId ?? this.selectedId,
      lastItem: lastItem ?? this.lastItem,
    );
  }
}
