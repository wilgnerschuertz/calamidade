import 'package:coopartilhar/app/features/{{name.snakeCase()}}/interactor/entities/{{name.snakeCase()}}_entity.dart';
import 'package:core_module/core_module.dart';

abstract class I{{name.pascalCase()}}Repository {
  Future<Output<{{name.pascalCase()}}Entity>> fetchData();
}