import 'package:coopartilhar/app/features/{{name.snakeCase()}}/data/adapters/{{name.snakeCase()}}_adapter.dart';
import 'package:coopartilhar/app/features/{{name.snakeCase()}}/interactor/entities/{{name.snakeCase()}}_entity.dart';
import 'package:coopartilhar/app/features/{{name.snakeCase()}}/interactor/exceptions/{{name.snakeCase()}}_exception.dart';
import 'package:coopartilhar/app/features/{{name.snakeCase()}}/interactor/repositories/i_{{name.snakeCase()}}_repository.dart';
import 'package:core_module/core_module.dart';

class {{name.pascalCase()}}RepositoryImpl implements I{{name.pascalCase()}}Repository {
  const {{name.pascalCase()}}RepositoryImpl({
    required this.restClient,
  });

  final IRestClient restClient;

  @override
  Future<Output<{{name.pascalCase()}}Entity>> fetchData() async {
    try {
      final response = await restClient.post(
        RestClientRequest(
          path: '',
          data: {},
        ),
      );

      return Right({{name.pascalCase()}}Adapter.fromJson(response.data));
    } on BaseException catch (err) {
      return Left({{name.pascalCase()}}Exception(message: err.message));
    } catch (_) {
      return const Left(DefaultException(message: 'Erro desconhecido'));
    }
  }
}