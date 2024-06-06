import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/shared_preference_utils.dart';
import '../../domain/entities/login_req.dart';
import '../../domain/usecases/login_usecases.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginUsecases usecases;
  LoginBloc({required this.usecases}) : super(LoginInitial()) {
    on<DoLoginEvent>(_doLogin);
    on<DoValidation>(_validation);
  }

  Future _doLogin(DoLoginEvent event, Emitter emit) async {
    emit(LoginLoadingState());
    final result = await usecases.call(event.req);
    result.fold(
      (l) => emit(LoginErrorState(msg: l.message)),
      (r) {
        SharedPrefUtil.storeToken(r.token);

        emit(LoginSuccessState());
      },
    );
  }

  void _validation(DoValidation event, Emitter emit) {
    emit(LoginInitial());
    if (event.username == "") {
      emit(const LoginValidationErrorState(msg: "Username required"));
      return;
    }
    if (event.password == "") {
      emit(const LoginValidationErrorState(msg: "Password required"));
      return;
    }
    if (event.password.length < 6) {
      emit(const LoginValidationErrorState(msg: "Password must be at least 6 characters"));
      return;
    }
    add(DoLoginEvent(req: LoginReq(username: event.username, password: event.password)));
  }
}
