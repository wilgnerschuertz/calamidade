import 'package:coopartilhar/app/features/request_details/interactor/repositories/i_request_details_repository.dart';
import 'package:coopartilhar/app/features/request_details/interactor/state/request_state.dart';
import 'package:core_module/core_module.dart';

class RequestDetailsController extends BaseController {
  final IRequestDetailsRepository repository;

  RequestDetailsController(this.repository) : super(InitialState());

  Future<void> loadRequestDetails({required String id}) async {
    update(LoadingState());
    final response = await repository.getRequestById(id);

    response.fold(
      (l) => update(ErrorState(exception: l)),
      (r) => update(SuccessState<RequestEntity>(data: r)),
    );
  }

  Future<void> patronize(
      {required RequestEntity request, required int godFatherId}) async {
    update(LoadingState());
    final response = await repository.patronize(request, godFatherId);

    response.fold(
      (l) => update(ErrorState(exception: l)),
      (r) => update(SuccessPatronizeState(data: r)),
    );
  }
}
