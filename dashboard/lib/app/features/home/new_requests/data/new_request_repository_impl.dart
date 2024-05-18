import 'package:core_module/core_module.dart';
import 'package:dashboard/app/features/home/new_requests/data/i_new_request_repository.dart';
import 'package:dashboard/app/features/home/new_requests/entities/new_request_entity.dart';

class NewRequestRepositoryImpl implements INewRequestRepository {
  final IRestClient _restClient;

  const NewRequestRepositoryImpl({
    required IRestClient restClient,
  }) : _restClient = restClient;

  @override
  Future<Output<NewRequestEntity>> getNewRequest() async {
    try {
      final response = await _restClient.get(RestClientRequest(path: 'url'));
      if (response.data == null) {
        return const Left(DefaultException(message: 'Requisição inválida'));
      }

      // TODO retornar o adapter da entidade
      return Right(
        NewRequestEntity(
          '0',
          titleDescription: 'Telhado',
          name: 'João Maria da Silva',
          city: 'Estância Velha',
          phone: '+55 (51) 9 1234-5648',
          date: '15 de maio às 10h',
          status: StatusNewRequest.low,
          requestedIncome: '3.500,00',
          bank: 'CooperBank',
          agency: 'Estância Velha',
          account: '+55 (51) 9 1234-5648',
          urlImage: 'url',
          description: 'Qualquer coisa...',
        ),
      );
    } on BaseException catch (err) {
      return Left(DefaultException(message: err.message));
    } catch (_) {
      return const Left(DefaultException(message: 'Erro desconhecido'));
    }
  }
}
