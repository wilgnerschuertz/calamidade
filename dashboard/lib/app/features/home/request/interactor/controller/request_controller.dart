import 'package:core_module/core_module.dart';
import 'package:dashboard/app/features/home/request/interactor/repositories/request_repository.dart';
import 'package:dashboard/app/features/home/request/interactor/states/request_state.dart';

class RequestController extends BaseController<BaseState> {
  final RequestRepository _repository;

  RequestController(this._repository) : super(NewRequestsInitialState());

  Future<void> fetchNewRequests() async {
    update(NewRequestsLoadingState());

    final result = await _repository.getRequests();
    print(
      result.fold(
        (error) => print(error),
        (success) => print(success),
      ),
    );

    final data = <RequestEntity>[];

    RequestEntity? lastRequest;

    if (data.length.isOdd) {
      lastRequest = data.removeLast();
    }

    update(
      NewRequestsSuccessState(data: data, lastItem: lastRequest),
    );

    _repository.getRequests().fold(
      (l) => update(NewRequestsErrorState(exception: l)),
      (r) {
        RequestEntity? lastRequest;

        if (r.length.isOdd) {
          lastRequest = r.removeLast();
        }

        update(NewRequestsSuccessState(data: r, lastItem: lastRequest));
      },
    );
  }

  void selectItem(int? itemId) {
    final newState = (state as NewRequestsSuccessState).copyWith(
      selectedId: itemId,
    );

    update(newState);
  }
}
