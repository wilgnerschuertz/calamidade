import 'package:coopartilhar/app/features/file/entities/pressigned_entity.dart';

class PresignedUrlAdapter {
  static PressignedEntity fromJson(Map<String, dynamic> data) {
    print(data);
    return PressignedEntity(
      1,
      url: data['url'],
      key: data['key'],
      fileId: data['fileId'],
    );
  }
}
