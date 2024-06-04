import 'package:dokan/src/core/utils/app_extension.dart';
import 'package:dokan/src/features/register/domain/usecases/register_usecases.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/datasources/register_req.dart';

part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  final RegisterUsecases usecases;
  RegisterBloc(this.usecases) : super(RegisterInitial()) {
    on<DoSignupEvent>(_doRegistration);
    on<DoSignupValidationEvent>(_validation);
  }

  Future _doRegistration(DoSignupEvent event, Emitter emit) async {
    emit(RegisterLoadingState());
    final result = await usecases.call(event.req);
    result.fold(
      (l) => emit(RegisterError(msg: l.message)),
      (r) => emit(RegisterSuccessState()),
    );
  }

  void _validation(DoSignupValidationEvent event, Emitter emit) {
    emit(RegisterInitial());
    if (event.req.username == "") {
      emit(const RegisterValidationError(msg: "Username required"));
      return;
    }
    if (event.req.email == "") {
      emit(const RegisterValidationError(msg: "Email required"));
      return;
    }
    if (!event.req.email.isValidEmail()) {
      emit(const RegisterValidationError(msg: "Valid email required"));
      return;
    }
    if (event.req.password == "") {
      emit(const RegisterValidationError(msg: "Password required"));
      return;
    }
    if (event.req.password.length < 6) {
      emit(const RegisterValidationError(msg: "Password must be at least 6 characters"));
      return;
    }

    if (event.req.confirmPassword == "") {
      emit(const RegisterValidationError(msg: "Confirm Password required"));
      return;
    }
    if (event.req.password != event.req.confirmPassword) {
      emit(const RegisterValidationError(msg: "Password and Confirm password must be same."));
      return;
    }

    add(DoSignupEvent(req: event.req));
  }
}
