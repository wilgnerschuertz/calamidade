import 'package:core_module/core_module.dart';

class {{name.pascalCase()}}Exception extends BaseException {
  {{name.pascalCase()}}Exception({
    required super.message,
  });
}
