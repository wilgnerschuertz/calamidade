import 'package:coopartilhar/app/features/home/interactor/entities/god_father_entity.dart';

class GodFatherAdapter {
  static GodFatherEntity fromJson(Map<String, dynamic> json) =>
      GodFatherEntity(id: json['id'] ?? -1);
}
