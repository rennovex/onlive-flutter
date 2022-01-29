import 'package:get_it/get_it.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:http/http.dart' as http;
import 'Features/Registration/domain/usecases/get_interests.dart';
import 'Features/Registration/presentation/cubit/public_profile_cubit.dart';
import 'Features/Registration/presentation/cubit/reg_user_cubit.dart';

import 'Features/Auth/data/repositories/user_repository_impl.dart';
import 'Features/Auth/domain/repositories/user_repository.dart';
import 'Features/Auth/domain/usecase/post_login.dart';
import 'Features/Auth/presentation/cubit/auth_cubit.dart';
import 'core/network/network_info.dart';

final sl = GetIt.instance;

Future<void> init() async {
  //! Features - Auth
  // Bloc
  sl.registerFactory(
    () => AuthCubit(postLogin: sl()),
  );

  //UseCases
  sl.registerLazySingleton(() => PostLogin(sl()));

  // Repository
  sl.registerLazySingleton<UserRepository>(() => UserRepositoryImpl(sl()));

  // Data sources
  // sl.registerLazySingleton<PostsRemoteDataSource>(
  //   () => PostsRemoteDataSourceImpl(
  //     client: sl(),
  //   ),
  // );

  // sl.registerLazySingleton<PostsLocalDataSource>(
  //   () => PostsLocalDataSourceImpl(
  //     sharedPreferences: sl(),
  //   ),
  // );

  //! Features - Registration
  // Bloc
  sl.registerFactory(
    () => RegUserCubit(),
  );
  sl.registerFactory(() => PublicProfileCubit(sl()));

  //UseCases
  // sl.registerLazySingleton(() => GetInterests(sl()));

  // Repository
  // sl.registerLazySingleton<UserRepository>(() => UserRepositoryImpl(sl()));

  // Data sources

  //! Core
  sl.registerLazySingleton<NetworkInfo>(
    () => NetworkInfoImpl(
      connectionChecker: sl(),
    ),
  );

  //! External
  // final sharedPreferences = await SharedPreferences.getInstance();
  // sl.registerLazySingleton(() => sharedPreferences);
  sl.registerLazySingleton(() => http.Client());
  sl.registerLazySingleton(() => InternetConnectionChecker());
  sl.registerFactory(
    () => GoogleSignIn(
      scopes: [
        'email',
        'https://www.googleapis.com/auth/contacts.readonly',
      ],
    ),
  );
}
