import 'package:coopartilhar/app/features/helps/interactor/repositories/i_helps_repository.dart';
import 'package:coopartilhar/app/features/helps/interactor/state/helps_state.dart';
import 'package:core_module/core_module.dart';

class HelpsController extends BaseController<BaseState> {
  final IHelpsRepository _helpsRepository;
  HelpsController(
    this._helpsRepository,
  ) : super(HelpsInitial());

  Future<void> getHelpsData() async {
    update(HelpsLoading());
    final result = await _helpsRepository.fetchData();
    result.fold(
      (left) => update(HelpsError(exception: left)),
      (right) => update(HelpsSuccess(data: right)),
    );
  }
}