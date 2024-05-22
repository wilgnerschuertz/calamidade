import 'package:coopartilhar/app/features/address/entities/address_entity.dart';
import 'package:core_module/core_module.dart';

class AddressLoadingState extends BaseState {}

class AddressLoadedState implements BaseState {
  final List<AddressEntity> addresses;
  final AddressEntity? selectedAddress;

  AddressLoadedState(this.addresses, {this.selectedAddress});
}
