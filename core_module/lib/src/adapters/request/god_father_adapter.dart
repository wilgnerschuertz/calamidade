import '../../entities/request/god_father.dart';

class GodFatherAdapter {
  static GodFather fromJson(Map<String, dynamic> map) {
    return GodFather(
      id: map['id'] ?? -1,
      email: map['email'] ?? '',
      firstName: map['firstName'] ?? '',
      lastName: map['lastName'] ?? '',
      document: map['document'] ?? '',
      phone: map['telephone'] ?? '',
      photo: map['photo'] ?? '',
      createdAt: DateTime.parse(map['createdAt']),
      updatedAt: DateTime.parse(map['updatedAt']),
      deleteAt:
          map['deleteAt'] != null ? DateTime.parse(map['deleteAt']) : null,
    );
  }
}
