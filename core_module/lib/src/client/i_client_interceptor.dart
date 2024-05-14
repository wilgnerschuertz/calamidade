import 'rest_client_request.dart';
import 'rest_client_response.dart';

abstract interface class IClientInterceptor{
  Future<RestClientResponse> onResponse(RestClientResponse response);
  Future<RestClientRequest> onRequest(RestClientRequest request);
  Future<RestClientResponse> onError(RestClientResponse error);
}