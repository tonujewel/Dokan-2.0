import '../../domain/entities/login_entity.dart';

class LoginModel extends LoginEntity {
  const LoginModel({
    required super.token,
    required super.userEmail,
    required super.userNiceName,
    required super.displayName,
  });

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
        token: json["token"],
        userEmail: json["user_email"],
        userNiceName: json["user_nicename"],
        displayName: json["user_display_name"],
      );
}
