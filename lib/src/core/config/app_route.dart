import 'package:go_router/go_router.dart';

import '../../features/home_screen.dart';
import '../../features/login/presentation/pages/login_screen.dart';
import '../../features/splash/screen/splash_screen.dart';
import 'route_constant.dart';

final router = GoRouter(
  routes: [
    // Splash
    GoRoute(
      path: RouteConstant.splash,
      builder: (context, state) => const SplashScreen(),
    ),

    // Login
    GoRoute(
      path: RouteConstant.login,
      builder: (context, state) => const LoginScreen(),
    ),

    // Home
    GoRoute(
      path: RouteConstant.home,
      builder: (context, state) => const HomeScreen(),
    ),
    // GoRoute(
    //     path: AppConstant.details,
    //     builder: (context, state) {
    //       final product = state.extra as RepositoryEntity;
    //       return DetailsScreen(data: product);
    //     }),
  ],
);
