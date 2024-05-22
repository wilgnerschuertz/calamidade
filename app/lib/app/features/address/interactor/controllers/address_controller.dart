import 'package:coopartilhar/app/features/address/entities/address_entity.dart';
import 'package:coopartilhar/app/features/address/interactor/repositories/i_address_repository.dart';
import 'package:coopartilhar/app/features/address/interactor/states/address_states.dart';
import 'package:core_module/core_module.dart';

class AddressController extends BaseController {
  final IAddressRepository repository;

  AddressController(this.repository) : super(InitialState());

  Future<void> getAll(AddressEntity? selectedAddress) async {
    update(AddressLoadingState());
    final response = await repository.getAll();
    response.fold(
      (error) => update(ErrorState<BaseException>(exception: error)),
      (data) => update(AddressLoadedState(
        data,
        selectedAddress: selectedAddress,
      )),
    );
  }

  void changeAddress(AddressEntity address) {
    final currentState = state;
    if (currentState is AddressLoadedState) {
      update(AddressLoadedState(
        currentState.addresses,
        selectedAddress: address,
      ));
    }
  }
}
