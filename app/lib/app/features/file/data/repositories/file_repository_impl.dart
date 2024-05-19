import 'package:coopartilhar/app/features/file/data/adapters/presigned_url_adapter.dart';
import 'package:coopartilhar/app/features/file/data/repositories/i_file_repository.dart';
import 'package:coopartilhar/app/features/file/entities/file_entity.dart';
import 'package:coopartilhar/app/features/file/entities/pressigned_entity.dart';
import 'package:core_module/core_module.dart';

class FileRepositoryImpl implements IFileRepository {
  final IRestClient restClient;
  FileRepositoryImpl(this.restClient);

  @override
  Future<Output<PressignedEntity>> getPresignedUrl(
      {required String fileName, String? folder}) async {
    try {
      const path = '/core/v1/file/presigned-url';
      final response = await restClient.get(
        RestClientRequest(
          path: path,
          queryParameters: {
            'fileName': fileName,
            'folder': folder,
          },
        ),
      );
      final PressignedEntity presignedUrl =
          PresignedUrlAdapter.fromJson(response.data as Map<String, dynamic>);
      return Right(presignedUrl);
    } on BaseException catch (err) {
      return Left(err);
    } catch (_) {
      return const Left(
          DefaultException(message: 'Ocorreu um erro inesperado.'));
    }
  }

  @override
  Future<Output<FileEntity>> upload({
    required String fileName,
    required PressignedEntity presignedUrl,
    List<int>? fileBytes,
  }) async {
    try {
      final response = await restClient.upload(RestClientMultipart(
        fileKey: presignedUrl.key,
        fileName: fileName,
        path: presignedUrl.url,
        fileBytes: fileBytes,
      ));
      return Right(FileEntity(-1, 'test', 'test'));
    } on BaseException catch (err) {
      return Left(err);
    } catch (_) {
      return const Left(
          DefaultException(message: 'Ocorreu um erro inesperado.'));
    }
  }
}
