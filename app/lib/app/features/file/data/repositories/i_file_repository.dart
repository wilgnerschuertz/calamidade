import 'package:coopartilhar/app/features/file/entities/file_entity.dart';
import 'package:coopartilhar/app/features/file/entities/pressigned_entity.dart';
import 'package:core_module/core_module.dart';

abstract class IFileRepository {
  Future<Output<PressignedEntity>> getPresignedUrl(
      {required String fileName, String? folder});

  Future<Output<FileEntity>> upload({
    required String fileName,
    required PressignedEntity presignedUrl,
    List<int>? fileBytes,
  });
}
