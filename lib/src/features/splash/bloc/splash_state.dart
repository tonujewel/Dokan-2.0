part of 'splash_bloc.dart';

sealed class SplashState extends Equatable {
  const SplashState();

  @override
  List<Object> get props => [];
}

final class SplashInitial extends SplashState {
  @override
  List<Object> get props => [];
}

class SplashLoading extends SplashState {
  @override
  List<Object> get props => [];
}

class SplashLoadedForHome extends SplashState {
  @override
  List<Object> get props => [];
}

class SplashLoadedForLogin extends SplashState {
  @override
  List<Object> get props => [];
}
