import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  final String token;
  final String userEmail;
  final String userNiceName;
  final String displayName;

  const UserEntity({
    required this.token,
    required this.userEmail,
    required this.userNiceName,
    required this.displayName,
  });

  @override
  List<Object?> get props => [token, userEmail, userNiceName, displayName];
}
