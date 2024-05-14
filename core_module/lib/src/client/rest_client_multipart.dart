class RestClientMultipart{
  final String fileName;
  final String path;
  final List<int>? fileBytes;

  RestClientMultipart({
    required this.fileName,
    required this.path,
    required this.fileBytes,
  });
}