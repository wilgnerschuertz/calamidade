import 'package:coopartilhar/app/features/address/data/adapters/address_adapter.dart';
import 'package:coopartilhar/app/features/address/entities/address_entity.dart';
import 'package:coopartilhar/app/features/address/interactor/repositories/i_address_repository.dart';
import 'package:core_module/core_module.dart';

class AddressRepositoryImpl implements IAddressRepository {
  final IRestClient restClient;
  AddressRepositoryImpl(this.restClient);

  @override
  Future<Output<List<AddressEntity>>> getAll() async {
    try {
      final response = await restClient.get(
        RestClientRequest(
          path: '/core/v1/address',
        ),
      );
      final responseData = response.data;
      final List<AddressEntity> addresses = [];
      if (responseData['data'] != null) {
        responseData['data'].forEach(
          (dynamic addressData) {
            addresses.add(
                AddressAdapter.fromJson(addressData as Map<String, dynamic>));
          },
        );
      }
      return Right(addresses);
    } on BaseException catch (err) {
      return Left(err);
    } catch (_) {
      return const Left(
          DefaultException(message: 'Ocorreu um erro inesperado.'));
    }
  }

  @override
  Future<Output<Unit>> save(AddressEntity address) async {
    try {
      await restClient.post(
        RestClientRequest(
          path: '/core/v1/address',
          data: AddressAdapter.toJson(address),
        ),
      );
      return const Right(unit);
    } on BaseException catch (err) {
      return Left(err);
    } catch (_) {
      return const Left(
          DefaultException(message: 'Ocorreu um erro inesperado.'));
    }
  }

  @override
  Future<Output<Unit>> remove(int id) async {
    try {
      await restClient.delete(
        RestClientRequest(
          path: '/core/v1/address/$id',
        ),
      );
      return const Right(unit);
    } on BaseException catch (err) {
      return Left(err);
    } catch (_) {
      return const Left(
          DefaultException(message: 'Ocorreu um erro inesperado.'));
    }
  }
}
