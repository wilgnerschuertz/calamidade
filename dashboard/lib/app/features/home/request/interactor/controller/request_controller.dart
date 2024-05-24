import 'package:core_module/core_module.dart';
import 'package:dashboard/app/features/home/request/interactor/repositories/i_request_repository.dart';
import 'package:dashboard/app/features/home/request/interactor/states/request_state.dart';

class RequestController extends BaseController<BaseState> {
  final IRequestRepository _repository;

  RequestController(this._repository) : super(NewRequestsInitialState());

  Future<void> fetchNewRequests() async {
    update(NewRequestsLoadingState());

    final response = await _repository.getRequests();

    response.fold(
      (l) => update(NewRequestsErrorState(exception: l)),
      (r) {
        RequestEntity? lastRequest;

        if (r.requests.length.isOdd) {
          lastRequest = r.requests.removeLast();
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
