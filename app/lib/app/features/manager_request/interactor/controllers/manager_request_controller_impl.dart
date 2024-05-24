import 'package:coopartilhar/app/features/manager_request/interactor/repositories/i_manager_request_repository.dart';

import 'package:core_module/core_module.dart';

class ManagerRequestControllerImpl extends BaseController {
  final IManagerRequestRepository _managerRequestRepository;

  ManagerRequestControllerImpl(this._managerRequestRepository)
      : super(InitialState());

  Future<void> getRequests() async {
    update(LoadingState());
    final result = await _managerRequestRepository.getRequests();
    result.fold(
      (left) => update(ErrorState(exception: left)),
      (right) => update(SuccessState(data: right)),
    );
  }
}
