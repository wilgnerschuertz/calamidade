import 'package:core_module/core_module.dart';

class AddressLocationLoadingState extends BaseState {}

class AddressLocationLoadedState implements BaseState {
  Coordinates? coordinates;
  AddressLocationLoadedState(this.coordinates);
}

class AddressLocationErrorState extends BaseState implements Exception {
  AddressLocationErrorState();
}
