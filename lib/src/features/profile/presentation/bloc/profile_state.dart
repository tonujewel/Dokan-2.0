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
  final String error;
  final UserEntity? userEntity;
  final bool isLoading;

  const ProfileInitial({
    this.isAccountOpen = true,
    this.isPasswordOpen = false,
    this.isNotificationOpen = false,
    this.isWishListOpen = false,
    this.error = "",
    this.userEntity,
    this.isLoading = false,
  });

  ProfileInitial copyWith({
    bool? isAccountOpen,
    bool? isPasswordOpen,
    bool? isNotificationOpen,
    bool? isWishListOpen,
    String? error,
    UserEntity? userEntity,
    bool? isLoading,
  }) {
    return ProfileInitial(
      isAccountOpen: isAccountOpen ?? this.isAccountOpen,
      isPasswordOpen: isPasswordOpen ?? this.isPasswordOpen,
      isNotificationOpen: isNotificationOpen ?? this.isNotificationOpen,
      isWishListOpen: isWishListOpen ?? this.isWishListOpen,
      error: error ?? this.error,
      userEntity: userEntity,
      isLoading: isLoading ?? this.isLoading,
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
