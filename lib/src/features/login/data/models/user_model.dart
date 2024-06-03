import '../../domain/entities/user_entity.dart';

class UserModel extends UserEntity {
  const UserModel({
    required super.token,
    required super.userEmail,
    required super.userNiceName,
    required super.displayName,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        token: json["token"],
        userEmail: json["user_email"],
        userNiceName: json["user_nicename"],
        displayName: json["user_display_name"],
      );
}
