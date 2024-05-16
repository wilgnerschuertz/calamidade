import 'package:coopartilhar/app/features/ask_help/data/repositories/i_new_ask_help_repository.dart';
import 'package:coopartilhar/app/features/ask_help/entities/solicitation_entity.dart';
import 'package:core_module/core_module.dart';

class NewAskHelpRepositoryImpl implements INewAskHelpRepository {
  final IRestClient restClient;

  NewAskHelpRepositoryImpl(this.restClient);

  @override
  Future<Output<void>> saveSolicitation(SolicitationEntity solicitationEntity) async {
    try {
      //TODO: impl correct endpoint
      const url = '';
      final response = await restClient.post<Map<String, dynamic>>(RestClientRequest(path: '$url/${solicitationEntity.id}'));
      if (response.data == null) {
        throw const DefaultException(message: 'Requisição inválida.');
      }
      return const Right(null);
    } on BaseException catch (err) {
      return Left(DefaultException(message: err.message));
    } catch (_) {
      return const Left(DefaultException(message: 'Ocorreu um erro inesperado.'));
    }
  }
}
