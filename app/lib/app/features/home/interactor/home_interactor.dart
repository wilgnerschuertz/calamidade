import 'package:coopartilhar/app/features/home/interactor/home_state.dart';
import 'package:coopartilhar/app/features/home/interactor/interfaces/i_home_repository.dart';
import 'package:core_module/core_module.dart';

class HomeInteractor extends BaseController<BaseState> {
  final IHomeRepository _homeRepository;
  HomeInteractor(this._homeRepository) : super(HomeInitial());

  Future<void> getOrders() async {
    update(HomeLoading());
    final result = await _homeRepository.getOrders();
    result.fold(
      (left) => update(HomeError(left)),
      (right) => update(HomeSuccess(data: right)),
    );
  }
}
