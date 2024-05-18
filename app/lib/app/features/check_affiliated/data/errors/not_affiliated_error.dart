import 'package:core_module/core_module.dart';

class NotAffiliatedError extends BaseException {
  NotAffiliatedError({String? message})
      : super(message: message ?? 'Não é um coperado');
}
