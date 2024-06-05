import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  final int id;
  final String username;
  final String name;
  final String firstName;
  final String lastName;
  final String email;
  final String url;
  final String description;
  final String link;
  final String locale;
  final String nickname;
  final String slug;
  final String registeredDate;

  const UserEntity(
      {required this.id,
      required this.username,
      required this.name,
      required this.firstName,
      required this.lastName,
      required this.email,
      required this.url,
      required this.description,
      required this.link,
      required this.locale,
      required this.nickname,
      required this.slug,
      required this.registeredDate});

  static const UserEntity empty = UserEntity(
    id: 0,
    username: '',
    name: '',
    firstName: '',
    lastName: '',
    email: '',
    url: '',
    description: '',
    link: '',
    locale: '',
    nickname: '',
    slug: '',
    registeredDate: '',
  );

  @override
  List<Object?> get props => [
        id,
        username,
        name,
        firstName,
        lastName,
        email,
        url,
        description,
        link,
        locale,
        nickname,
        slug,
        registeredDate,
      ];
}
