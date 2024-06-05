import 'dart:developer';

import 'package:dokan/src/features/profile/domain/usecases/get_profile_usecase.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/entities/user_entity.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileInitial> {
  final GetProfileUsecase getProfileUsecase;
  ProfileBloc(this.getProfileUsecase) : super(const ProfileInitial()) {
    on<ExpansionCollapsAction>(_expandCollapsAction);
    on<GetProfileData>(_getProfileDataAction);
  }
  void _expandCollapsAction(ExpansionCollapsAction event, Emitter emit) {
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

  void _getProfileDataAction(GetProfileData event, Emitter emit) async {
    try {
      final result = await getProfileUsecase.call();
      result.fold(
        (failure) => emit(state.copyWith(error: failure.message)),
        (userEntity) {
          log(userEntity.firstName);
          emit(state.copyWith(userEntity: userEntity));
        },
      );
    } catch (e) {
      emit(state.copyWith(error: "Something went wrong"));
    }
  }
}
