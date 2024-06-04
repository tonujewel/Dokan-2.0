part of 'register_bloc.dart';

abstract class RegisterEvent extends Equatable {
  const RegisterEvent();

  @override
  List<Object> get props => [];
}

class DoSignupEvent extends RegisterEvent {
  final RegisterReq req;

  const DoSignupEvent({required this.req});
}

class DoSignupValidationEvent extends RegisterEvent {
  final RegisterReq req;

  const DoSignupValidationEvent({required this.req});
}
