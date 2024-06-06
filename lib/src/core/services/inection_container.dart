import 'package:get_it/get_it.dart';

import '../../features/home/data/datasources/product_data_src.dart';
import '../../features/home/data/repositories/product_repository_impl.dart';
import '../../features/home/domain/repositories/product_repository.dart';
import '../../features/home/domain/usecases/get_products_usecase.dart';
import '../../features/home/presentation/bloc/home_bloc.dart';
import '../../features/login/data/datasources/login_data_src.dart';
import '../../features/login/data/repositories/login_repository_impl.dart';
import '../../features/login/domain/repositories/login_repository.dart';
import '../../features/login/domain/usecases/login_usecases.dart';
import '../../features/login/presentation/bloc/login_bloc.dart';
import '../../features/profile/data/datasources/profile_data_src.dart';
import '../../features/profile/data/repositories/profile_repository_impl.dart';
import '../../features/profile/domain/repositories/profile_repository.dart';
import '../../features/profile/domain/usecases/get_profile_usecase.dart';
import '../../features/profile/presentation/bloc/profile_bloc.dart';
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
    ..registerFactory(() => HomeBloc(sl()))
    ..registerFactory(() => ProfileBloc(sl(), sl()))

    // Use cases
    ..registerLazySingleton(() => LoginUsecases(repository: sl()))
    ..registerLazySingleton(() => RegisterUsecases(repository: sl()))
    ..registerLazySingleton(() => GetProductsUsecase(repository: sl()))
    ..registerLazySingleton(() => GetProfileUsecase(repository: sl()))
    ..registerLazySingleton(() => UpdateProfileUseCase(repository: sl()))

    // repositories
    ..registerLazySingleton<LoginRepository>(() => LoginRepositoryImpl(dataSrc: sl()))
    ..registerLazySingleton<RegisterRepository>(() => RegisterRepositoryImpl(dataSrc: sl()))
    ..registerLazySingleton<ProductRepository>(() => ProductRepositoryImpl(dataSrc: sl()))
    ..registerLazySingleton<ProfileRepository>(() => ProfileRepositoryImpl(dataSrc: sl()))

    // Data sources
    ..registerLazySingleton<LoginDataSrc>(() => LoginDataSrcImpl(client: sl()))
    ..registerLazySingleton<RegisterDataSrc>(() => RegisterDataSrcImpl(client: sl()))
    ..registerLazySingleton<ProductDataSrc>(() => ProductDataSrcImpl())
    ..registerLazySingleton<ProfileDataSrc>(() => ProfileDataSrcImpl(client: sl()))

    // external dependencies
    ..registerFactory(() => DioClient());
}
