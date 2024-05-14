class RestClientRequest{
  final String path;
  final dynamic data;
  final Map<String, dynamic>? queryParameters;
  final Map<String, dynamic>? headers;

  RestClientRequest({
    required this.path, 
    this.data,
    this.queryParameters,
    this.headers,
  });
}