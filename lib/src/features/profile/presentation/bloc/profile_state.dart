part of 'profile_bloc.dart';

abstract class ProfileState extends Equatable {
  const ProfileState();

  @override
  List<Object> get props => [];
}

class ProfileInitial extends ProfileState {
  final bool isAccountOpen;
  final bool isPasswordOpen;
  final bool isNotificationOpen;
  final bool isWishListOpen;

  const ProfileInitial({
    this.isAccountOpen = false,
    this.isPasswordOpen = false,
    this.isNotificationOpen = false,
    this.isWishListOpen = false,
  });

  ProfileInitial copyWith({
    bool? isAccountOpen,
    bool? isPasswordOpen,
    bool? isNotificationOpen,
    bool? isWishListOpen,
  }) {
    return ProfileInitial(
      isAccountOpen: isAccountOpen ?? this.isAccountOpen,
      isPasswordOpen: isPasswordOpen ?? this.isPasswordOpen,
      isNotificationOpen: isNotificationOpen ?? this.isNotificationOpen,
      isWishListOpen: isWishListOpen ?? this.isWishListOpen,
    );
  }

  @override
  List<Object> get props => [
        isAccountOpen,
        isPasswordOpen,
        isNotificationOpen,
        isWishListOpen,
      ];
}
