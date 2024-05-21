import 'package:core_module/src/file_picker/i_file_picker.dart';
import 'package:file_picker/file_picker.dart';

class FilePickerServiceImpl implements IFilePickerService {
  @override
  Future<List<String>?> pickFiles({
    List<String>? allowedExtensions,
    bool allowMultiple = false,
  }) async {
    final FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: allowedExtensions != null ? FileType.custom : FileType.any,
      allowedExtensions: allowedExtensions,
      allowMultiple: allowMultiple,
    );
    if (result != null && result.files.isNotEmpty) {
      return result.files.map((file) => file.path!).toList();
    }
    return null;
  }
}
