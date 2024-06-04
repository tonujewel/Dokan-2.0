part of 'login_bloc.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object> get props => [];
}

class DoLoginEvent extends LoginEvent {
  final LoginReq req;
  const DoLoginEvent({required this.req});

  @override
  List<Object> get props => [req];
}

class DoValidation extends LoginEvent {
  final String username;
  final String password;

  const DoValidation({required this.username, required this.password});
}
