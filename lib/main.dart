import 'package:dokan/src/features/login/presentation/bloc/login_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'src/core/config/my_app.dart';
import 'src/core/services/inection_container.dart';
import 'src/features/splash/bloc/splash_bloc.dart';

void main() async{
   await init();
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => SplashBloc()),
        BlocProvider(create: (_) => sl<LoginBloc>()),
      ],
      child: const MyApp(),
    ),
  );
}
