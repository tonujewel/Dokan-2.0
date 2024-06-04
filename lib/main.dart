import 'package:dokan/src/core/utils/shared_preference_utils.dart';
import 'package:dokan/src/features/register/presentation/bloc/register_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'src/features/login/presentation/bloc/login_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'src/core/config/my_app.dart';
import 'src/core/services/inection_container.dart';
import 'src/features/splash/bloc/splash_bloc.dart';

SharedPreferences? prefs;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await init();
  await SharedPrefUtil.prefInit();
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => SplashBloc()),
        BlocProvider(create: (_) => sl<LoginBloc>()),
        BlocProvider(create: (_) => sl<RegisterBloc>()),
      ],
      child: const MyApp(),
    ),
  );
}
