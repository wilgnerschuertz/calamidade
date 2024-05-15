import 'rest_client_http_message.dart';
import 'rest_client_response.dart';

class RestClientException implements Exception, RestClientHttpMessage {
  String? message;
  int? statusCode;
  dynamic error;
  RestClientResponse? response;

  RestClientException({
    this.message,
    this.statusCode,
    required this.error,
    this.response,
  });
}
