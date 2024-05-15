import 'package:core_module/core_module.dart';

class OnboardindException implements BaseException {
  @override
  final String message;

  @override
  final StackTrace? stackTracing;

  const OnboardindException({
    required this.message,
    this.stackTracing,
  });
}
