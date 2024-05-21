import 'package:coopartilhar/app/features/home/interactor/repositories/i_home_repository.dart';
import 'package:core_module/core_module.dart';

class HomeController extends BaseController<BaseState> {
  final IHomeRepository _homeRepository;
  HomeController(this._homeRepository) : super(InitialState());

  Future<void> getOrders() async {
    update(LoadingState());
    final result = await _homeRepository.getOrders();
    result.fold(
      (left) => update(ErrorState(exception: left)),
      (right) => update(SuccessState(data: right)),
    );
  }
}
