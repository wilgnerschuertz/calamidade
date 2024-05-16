import 'package:coopartilhar/app/features/home/interactor/home_state.dart';
import 'package:coopartilhar/app/features/home/interactor/interfaces/i_home_repository.dart';
import 'package:core_module/core_module.dart';

enum TagType {
  general('Geral'),
  houses('Casas'),
  health('Saude'),
  animais('Animais'),
  shelters('Abrigos'),
  anxiety('Ansiedade');

  const TagType(this.label);
  final String label;
}

class HomeInteractor extends BaseController<BaseState> {
  final IHomeRepository _homeRepository;
  HomeInteractor(this._homeRepository) : super(HomeInitial());

  Future<void> getOrders(TagType tagType) async {
    update(HomeLoading());
    final result = await _homeRepository.getOrders(tagType);
    result.fold(
      (left) => update(HomeError(left)),
      (right) => update(HomeSuccess(data: right)),
    );
  }
}
