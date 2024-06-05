import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileInitial> {
  ProfileBloc() : super(const ProfileInitial()) {
    on<ExpansionCollapsAction>(expandCollapsAction);
  }
  void expandCollapsAction(ExpansionCollapsAction event, Emitter emit) {
    final currentState = state;

    if (event.index == 0) {
      emit(currentState.copyWith(isAccountOpen: event.value));
    }

    if (event.index == 1) {
      emit(currentState.copyWith(isPasswordOpen: event.value));
    }

    if (event.index == 2) {
      emit(currentState.copyWith(isNotificationOpen: event.value));
    }

    if (event.index == 3) {
      emit(currentState.copyWith(isWishListOpen: event.value));
    }
  }
}
