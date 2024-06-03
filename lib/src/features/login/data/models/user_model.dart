import '../../domain/entities/user_entity.dart';

class UserModel extends UserEntity {
  const UserModel({
    required super.toke,
    required super.userEmail,
    required super.userNiceName,
    required super.displayName,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      toke: json["token"] ?? "",
      userEmail: json["user_email"] ?? "",
      userNiceName: json["user_nicename"] ?? "",
      displayName: json["user_display_name"] ?? "",
    );
  }
}
