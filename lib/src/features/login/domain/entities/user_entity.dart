import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  final String toke;
  final String userEmail;
  final String userNiceName;
  final String displayName;

  const UserEntity({
    required this.toke,
    required this.userEmail,
    required this.userNiceName,
    required this.displayName,
  });

  @override
  List<Object?> get props => [toke, userEmail, userNiceName, displayName];
}
