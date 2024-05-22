import 'package:coopartilhar/app/features/address/entities/address_entity.dart';
import 'package:coopartilhar/app/features/address/interactor/repositories/i_address_repository.dart';
import 'package:core_module/core_module.dart';

class AddressRepositoryImpl implements IAddressRepository {
  final IRestClient restClient;
  AddressRepositoryImpl(this.restClient);

  @override
  Future<Output<List<AddressEntity>>> getAll() async {
    try {
      // final response = await restClient.get(
      //   RestClientRequest(
      //     path: '/core/v1/address',
      //   ),
      // );
      // final data = response.data;
      // final List<AddressEntity> addresses =
      //     data.forEach((addressData) => AddressAdapter.fromJson(addressData));
      // TODO: REMOVER MOCK, AGUARDANDO ENDPOINT FICAR DISPONIVEL
      final List<AddressEntity> addresses = List<AddressEntity>.generate(
        3,
        (x) => AddressEntity(
          x,
          addressName: 'Minha Casa $x',
          street: 'Rua Flutterando',
          complement: 'Discord',
          number: '123',
          city: 'Test',
          uf: 'SP',
          cep: '12345',
          locationLatitude: '',
          locationLongitude: '',
        ),
      );
      await Future.delayed(const Duration(seconds: 2));
      return Right(addresses);
    } on BaseException catch (err) {
      return Left(err);
    } catch (_) {
      return const Left(
          DefaultException(message: 'Ocorreu um erro inesperado.'));
    }
  }

  @override
  Future<Output<void>> save(AddressEntity address) {
    throw UnimplementedError();
  }
}
