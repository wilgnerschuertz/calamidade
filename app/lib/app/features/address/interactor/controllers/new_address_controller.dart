import 'package:coopartilhar/app/features/address/entities/address_entity.dart';
import 'package:coopartilhar/app/features/address/interactor/controllers/address_controller.dart';
import 'package:coopartilhar/app/features/address/interactor/repositories/i_address_repository.dart';
import 'package:coopartilhar/app/features/address/interactor/states/address_location_states.dart';
import 'package:coopartilhar/app/features/auth/interactor/controllers/login_controller_impl.dart';
import 'package:coopartilhar/app/features/auth/interactor/states/auth_state.dart';
import 'package:core_module/core_module.dart';
import 'package:flutter/widgets.dart';

class NewAddressController extends BaseController {
  final ILocationService locationService;
  final PermissionHandler permissionHandler;
  final IAddressRepository addressRepository;
  final LoginControllerImpl userController;
  final AddressController addressPageController;

  NewAddressController(
    this.locationService,
    this.permissionHandler,
    this.addressRepository,
    this.userController,
    this.addressPageController,
  ) : super(InitialState());

  UserEntity user = UserEntity.init();
  late final formKey = GlobalKey<FormState>();

  late final TextEditingController identificationController =
      TextEditingController(text: '');
  late final TextEditingController addressController =
      TextEditingController(text: '');
  late final TextEditingController addressNumberController =
      TextEditingController(text: '');
  late final TextEditingController cityController =
      TextEditingController(text: '');
  late final TextEditingController ufController =
      TextEditingController(text: '');
  late final TextEditingController zipCodeController =
      TextEditingController(text: '');
  late final TextEditingController complementController =
      TextEditingController(text: '');
  late final TextEditingController geoLocationController =
      TextEditingController(text: '');

  Future<void> save() async {
    update(LoadingState());
    if (formKey.currentState!.validate()) {
      Coordinates? coordinatesData;
      if (state case AddressLocationLoadedState(:final coordinates)) {
        coordinatesData = coordinates;
      }
      if (userController.state case AuthSuccess(:final data)) {
        user = data;
      }
      final AddressEntity addressEntity = AddressEntity(
        -1,
        addressName: identificationController.text,
        street: addressController.text,
        complement: complementController.text,
        number: addressNumberController.text,
        city: cityController.text,
        uf: ufController.text,
        cep: zipCodeController.text,
        locationLatitude: '${coordinatesData?.latitude}',
        locationLongitude: '${coordinatesData?.longitude}',
        userId: user.id!,
      );

      final response = await addressRepository.save(addressEntity);
      response.fold(
        (error) => update(ErrorState<BaseException>(exception: error)),
        (data) async {
          await addressPageController.getAll(addressEntity);
          update(SuccessState(data: addressEntity));
        },
      );
    } else {
      update(InitialState());
    }
  }

  void geoLocation() async {
    try {
      update(AddressLocationLoadingState());
      final hasPermission = await permissionHandler.location();
      if (hasPermission) {
        final userLocation = await locationService.getUserLocation();
        update(AddressLocationLoadedState(userLocation));
        geoLocationController.text =
            '${userLocation.latitude}, ${userLocation.longitude}';
      }
    } catch (e) {
      update(AddressLocationErrorState());
    }
  }
}
