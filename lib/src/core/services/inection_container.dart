import 'package:dokan/src/features/login/data/datasources/login_data_src.dart';
import 'package:dokan/src/features/login/data/repositories/login_repository_impl.dart';
import 'package:dokan/src/features/login/domain/repositories/login_repository.dart';
import 'package:dokan/src/features/login/domain/usecases/login_usecases.dart';
import 'package:dokan/src/features/login/presentation/bloc/login_bloc.dart';
import 'package:get_it/get_it.dart';

import '../networking/dio_client.dart';

final sl = GetIt.instance;

Future<void> init() async {
  sl
    // Bloc
    ..registerFactory(() => LoginBloc(usecases: sl()))

    // Use cases
    ..registerLazySingleton(() => LoginUsecases(repository: sl()))

    // repositories
    ..registerLazySingleton<LoginRepository>(() => LoginRepositoryImpl(dataSrc: sl()))

    // Data sources
    ..registerLazySingleton<LoginDataSrc>(() => LoginDataSrcImpl(client: sl()))

    // external dependencies
    ..registerLazySingleton(() => DioClient());
}
