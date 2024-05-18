import 'package:core_module/core_module.dart';
import 'package:dashboard/app/features/home/new_requests/data/i_new_request_repository.dart';
import 'package:dashboard/app/features/home/new_requests/entities/new_request_entity.dart';

class NewRequestRepositoryImpl implements INewRequestRepository {
  final IRestClient restClient;

  const NewRequestRepositoryImpl(this.restClient);

  @override
  Future<Output<NewRequestEntity>> getNewRequest() async {
    try {
      final response = await restClient.get(RestClientRequest(path: 'url'));
      if (response.data == null) {
        return const Left(DefaultException(message: 'Requisição inválida'));
      }

      // TODO retornar o adapter da entidade
      return Right(
        NewRequestEntity(
          '0',
          name: 'João Maria da Silva',
          status: Status.baixa,
          city: 'Estância Velha',
          phone: '+55 (51) 9 1234-5648',
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
