import 'package:get_it/get_it.dart';

import '../../features/login/data/datasources/login_data_src.dart';
import '../../features/login/data/repositories/login_repository_impl.dart';
import '../../features/login/domain/repositories/login_repository.dart';
import '../../features/login/domain/usecases/login_usecases.dart';
import '../../features/login/presentation/bloc/login_bloc.dart';
import '../../features/register/data/datasources/register_data_src.dart';
import '../../features/register/data/repositories/register_repository_impl.dart';
import '../../features/register/domain/repositories/register_repository.dart';
import '../../features/register/domain/usecases/register_usecases.dart';
import '../../features/register/presentation/bloc/register_bloc.dart';
import '../networking/dio_client.dart';

final sl = GetIt.instance;

Future<void> init() async {
  sl
    // Bloc
    ..registerFactory(() => LoginBloc(usecases: sl()))
    ..registerFactory(() => RegisterBloc(sl()))

    // Use cases
    ..registerLazySingleton(() => LoginUsecases(repository: sl()))
    ..registerLazySingleton(() => RegisterUsecases(repository: sl()))

    // repositories
    ..registerLazySingleton<LoginRepository>(() => LoginRepositoryImpl(dataSrc: sl()))
    ..registerLazySingleton<RegisterRepository>(() => RegisterRepositoryImpl(dataSrc: sl()))

    // Data sources
    ..registerLazySingleton<LoginDataSrc>(() => LoginDataSrcImpl(client: sl()))
    ..registerLazySingleton<RegisterDataSrc>(() => RegisterDataSrcImpl(client: sl()))

    // external dependencies
    ..registerLazySingleton(() => DioClient());
}
