abstract class IFilePickerService {
  Future<List<String>?> pickFiles({List<String>? allowedExtensions});
}
