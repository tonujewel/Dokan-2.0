import '../../domain/entities/user_entity.dart';

class UserModel extends UserEntity {
  const UserModel(
      {required super.id,
      required super.username,
      required super.name,
      required super.firstName,
      required super.lastName,
      required super.email,
      required super.url,
      required super.description,
      required super.link,
      required super.locale,
      required super.nickname,
      required super.slug,
      required super.registeredDate});

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        id: json['id'],
        username: json['username'],
        name: json['name'],
        firstName: json['first_name'],
        lastName: json['last_name'],
        email: json['email'],
        url: json['url'],
        description: json['description'],
        link: json['link'],
        locale: json['locale'],
        nickname: json['nickname'],
        slug: json['slug'],
        registeredDate: json['registered_date'],
      );
}
