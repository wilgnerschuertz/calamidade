import 'dart:convert';

import 'package:coopartilhar/app/features/accident/entities/accident_entity.dart';
import 'package:coopartilhar/app/features/accident/data/repositories/i_accident_repository.dart';
import 'package:core_module/core_module.dart';

class AccidentRepositoryImpl implements IAccidentRepository {
  final IRestClient restClient;
  AccidentRepositoryImpl(this.restClient);

  @override
  Future<Output<Unit>> saveAccident(AccidentEntity accident) async {
    try {
      const path = '/core/v1/accident';
      await restClient.post(
        RestClientRequest(
          path: path,
          data: jsonEncode(accident),
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
