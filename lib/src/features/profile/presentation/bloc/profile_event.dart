part of 'profile_bloc.dart';

abstract class ProfileEvent extends Equatable {
  const ProfileEvent();

  @override
  List<Object> get props => [];
}

class ExpansionCollapsAction extends ProfileEvent {
  final bool value;
  final int index;

  const ExpansionCollapsAction({required this.value, required this.index});

  @override
  List<Object> get props => [value, index];
}

class GetProfileData extends ProfileEvent {}
