part of 'register_bloc.dart';

abstract class RegisterState extends Equatable {
  const RegisterState();

  @override
  List<Object> get props => [];
}

class RegisterInitial extends RegisterState {}

class RegisterLoadingState extends RegisterState {}

class RegisterSuccessState extends RegisterState {}

class RegisterValidationError extends RegisterState {
  final String msg;

  const RegisterValidationError({required this.msg});
  @override
  List<Object> get props => [msg];
}

class RegisterError extends RegisterState {
  final String msg;

  const RegisterError({required this.msg});
  @override
  List<Object> get props => [msg];
}
