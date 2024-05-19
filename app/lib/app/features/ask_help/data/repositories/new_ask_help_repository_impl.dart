import 'dart:convert';

import 'package:coopartilhar/app/features/ask_help/data/repositories/i_new_ask_help_repository.dart';
import 'package:coopartilhar/app/features/ask_help/entities/solicitation_entity.dart';
import 'package:core_module/core_module.dart';

class NewAskHelpRepositoryImpl implements INewAskHelpRepository {
  final IRestClient restClient;
  NewAskHelpRepositoryImpl(this.restClient);

  @override
  Future<Output<Unit>> saveSolicitation(
      SolicitationEntity solicitationEntity) async {
    try {
      const path = '/core/v1/requests';
      await restClient.post(
        RestClientRequest(
          path: path,
          data: jsonEncode(solicitationEntity),
          
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
