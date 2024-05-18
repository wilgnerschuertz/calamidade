import 'package:coopartilhar/app/features/{{name.snakeCase()}}/interactor/repositories/i_{{name.snakeCase()}}_repository.dart';
import 'package:coopartilhar/app/features/{{name.snakeCase()}}/interactor/state/{{name.snakeCase()}}_state.dart';
import 'package:core_module/core_module.dart';

class {{name.pascalCase()}}Controller extends BaseController<BaseState> {
  final I{{name.pascalCase()}}Repository _{{name.camelCase()}}Repository;
  {{name.pascalCase()}}Controller(
    this._{{name.camelCase()}}Repository,
  ) : super({{name.pascalCase()}}Initial());

  Future<void> get{{name.pascalCase()}}Data() async {
    update({{name.pascalCase()}}Loading());
    final result = await _{{name.camelCase()}}Repository.fetchData();
    result.fold(
      (left) => update({{name.pascalCase()}}Error(exception: left)),
      (right) => update({{name.pascalCase()}}Success(data: right)),
    );
  }
}