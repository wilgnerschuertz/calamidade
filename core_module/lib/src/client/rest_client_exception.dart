import '../../core_module.dart';

class RestClientException extends BaseException
    implements RestClientHttpMessage {
  int? statusCode;
  dynamic error;
  dynamic data;
  RestClientResponse? response;

  RestClientException({
    required super.message,
    this.statusCode,
    required this.error,
    this.data,
    this.response,
    super.stackTracing,
  });
}
