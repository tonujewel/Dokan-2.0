import 'package:equatable/equatable.dart';

class UpdateProfileReq extends Equatable {
  final String firstName;
  final String lastName;

  const UpdateProfileReq({required this.firstName, required this.lastName});

  Map<String, dynamic> toJson() => {"first_name": firstName, "last_name": lastName};
  @override
  List<Object?> get props => [firstName, lastName];
}
