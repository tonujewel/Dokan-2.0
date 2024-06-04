import '../../features/register/presentation/pages/register_screen.dart';
import 'package:go_router/go_router.dart';

import '../../features/home/presentation/pages/home_screen.dart';
import '../../features/login/presentation/pages/login_screen.dart';
import '../../features/main_screen/pages/main_screen.dart';
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
      builder: (context, state) => LoginScreen(),
    ),

    // Home
    GoRoute(
      path: RouteConstant.home,
      builder: (context, state) => const HomeScreen(),
    ),

    // Register
    GoRoute(
      path: RouteConstant.register,
      builder: (context, state) => RegisterScreen(),
    ),

    // Main screen
    GoRoute(
      path: RouteConstant.mainScreen,
      builder: (context, state) => const MainScreen(),
    ),

    // GoRoute(
    //     path: AppConstant.details,
    //     builder: (context, state) {
    //       final product = state.extra as RepositoryEntity;
    //       return DetailsScreen(data: product);
    //     }),
  ],
);
