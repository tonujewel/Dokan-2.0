import 'dart:developer';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/entities/login_req.dart';
import '../../domain/usecases/login_usecases.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginUsecases usecases;
  LoginBloc({required this.usecases}) : super(LoginInitial()) {
    // on<LoginEvent>((event, emit) {
    // });
    on<DoLoginEvent>(_doLogin);
  }

  Future _doLogin(DoLoginEvent event, Emitter emit) async {
    final result = await usecases.call(event.req);

    result.fold((l) => log("failed $l"), (r) => log("success $r"));
  }
}
