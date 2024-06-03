import 'package:go_router/go_router.dart';

import '../../feature/home_screen.dart';
import '../../feature/splash/screen/splash_screen.dart';
import 'route_constant.dart';

final router = GoRouter(
  routes: [
    GoRoute(
      path: RouteConstant.splash,
      builder: (context, state) => const SplashScreen(),
    ),
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
