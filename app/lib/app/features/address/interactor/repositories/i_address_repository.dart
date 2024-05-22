import 'package:coopartilhar/app/features/address/entities/address_entity.dart';
import 'package:core_module/core_module.dart';

abstract class IAddressRepository {
  Future<Output<List<AddressEntity>>> getAll();
  Future<Output<void>> save(AddressEntity address);
}
