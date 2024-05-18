import 'package:coopartilhar/app/features/{{name.snakeCase()}}/interactor/entities/{{name.snakeCase()}}_entity.dart';
import 'package:core_module/core_module.dart';

final class {{name.pascalCase()}}Initial implements InitialState {}

final class {{name.pascalCase()}}Loading implements LoadingState {}

final class {{name.pascalCase()}}Error extends ErrorState {
  const {{name.pascalCase()}}Error({required super.exception});
}

final class {{name.pascalCase()}}Success extends SuccessState<{{name.pascalCase()}}Entity> {
  const {{name.pascalCase()}}Success({required super.data});
}
