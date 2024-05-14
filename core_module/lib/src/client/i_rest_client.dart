import 'package:core_module/src/client/i_client_interceptor.dart';

import 'rest_client_request.dart';
import 'rest_client_response.dart';

abstract interface class IRestClient {

  Future<RestClientResponse<T>> post<T>(RestClientRequest request);

  Future<RestClientResponse<T>> get<T>(RestClientRequest request);
  
  Future<RestClientResponse<T>> put<T>(RestClientRequest request);
  
  Future<RestClientResponse<T>> delete<T>(RestClientRequest request);
  
  Future<RestClientResponse<T>> patch<T>(RestClientRequest request);

  void addInterceptors(IClientInterceptor interceptor);
  
  void removeInterceptors(IClientInterceptor interceptor); 
}