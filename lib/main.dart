import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'src/core/config/my_app.dart';
import 'src/feature/splash/bloc/splash_bloc.dart';

void main() {
  runApp(
    MultiBlocProvider(
      providers: [BlocProvider(create: (_) => SplashBloc())],
      child: const MyApp(),
    ),
  );
}
