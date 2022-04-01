import 'package:get_it/get_it.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:http/http.dart' as http;
import 'Features/Auth/data/datasources/auth_remote_data_source.dart';
import 'Features/Auth/domain/usecase/logout.dart';
import 'Features/Chat/domain/usecase/listen_to_redis.dart';
import 'Features/Chat/domain/usecase/save_chat.dart';
import 'Features/Chat/data/datasources/chat_local_data_source.dart';
import 'Features/Chat/data/datasources/chat_remote_data_source.dart';
import 'Features/Chat/data/repositories/chat_repository_impl.dart';
import 'Features/Chat/domain/repositories/chat_repository.dart';
import 'Features/Chat/domain/usecase/get_chats.dart';
import 'Features/Chat/domain/usecase/post_chat.dart';
import 'Features/Chat/presentation/bloc/chat_bloc.dart';
import 'Features/Chat/presentation/cubit/chat_overview_cubit.dart';
import 'Features/Chat/presentation/cubit/redis_cubit.dart';
import 'Features/Registration/presentation/bloc/reguser_bloc.dart';
import 'Utils/Router/app_router.dart';
import 'core/redis/redis_service.dart';
import 'package:redis/redis.dart';
import 'Features/Registration/domain/usecases/get_interests.dart';

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
    () => AuthCubit(postLogin: sl(), logout: sl()),
  );

  //UseCases
  sl.registerLazySingleton(() => PostLogin(sl()));
  sl.registerLazySingleton(() => Logout(sl()));

  // Repository
  sl.registerLazySingleton<UserRepository>(
      () => UserRepositoryImpl(sl(), sl()));

  // Data sources
  sl.registerLazySingleton<AuthRemoteDataSource>(
    () => AuthRemoteDataSourceImpl(
      client: sl(),
    ),
  );

  // sl.registerLazySingleton<PostsLocalDataSource>(
  //   () => PostsLocalDataSourceImpl(
  //     sharedPreferences: sl(),
  //   ),
  // );

  //! Features - Registration
  // Bloc

  sl.registerFactory(() => ReguserBloc());

  //UseCases

  // Repository
  // sl.registerLazySingleton<UserRepository>(() => UserRepositoryImpl(sl()));

  // Data sources

  //! Features - Chat
  // Bloc

  // sl.registerFactory(() => ChatBloc(postChat: sl()));
  sl.registerFactory(() => ChatOverviewCubit());
  sl.registerFactory(() => RedisCubit(listenToRedis: sl(), saveChat: sl()));

  //UseCases
  sl.registerLazySingleton(() => GetInterests(sl()));
  sl.registerFactory(() => ChatBloc(postChat: sl(), getChats: sl()));

  sl.registerLazySingleton(() => PostChat(sl()));
  sl.registerLazySingleton(() => GetChats(sl()));
  sl.registerLazySingleton(() => ListenToRedis(sl()));
  sl.registerLazySingleton(() => SaveChat(sl()));

  // Repository
  sl.registerLazySingleton<ChatRepository>(() => ChatRepositoryImpl(
        remoteDataSource: sl(),
        localDataSource: sl(),
        redisService: sl(),
      ));
  sl.registerLazySingleton<ChatRemoteDataSource>(
      () => ChatRemoteDataSourceImpl(client: sl()));
  sl.registerLazySingleton<ChatLocalDataSource>(
      () => ChatLocalDataSourceImpl());
  // sl.registerLazySingleton<ChatRemoteDataSource>(() => ChatRemoteDataSource();

  // Data sources

  //! Features - ChatOverview
  // Bloc

  //UseCases
  // sl.registerLazySingleton(() => GetInterests(sl()));
  // sl.registerFactory(() => ChatBloc(postChat: sl(), getChats: sl()));

  // Repository
  // sl.registerLazySingleton<ChatRepository>(() => ChatRepositoryImpl());

  // Data sources

  //! Core
  sl.registerLazySingleton<NetworkInfo>(
    () => NetworkInfoImpl(
      connectionChecker: sl(),
    ),
  );

  sl.registerFactory<RedisService>(() => RedisService(conn: sl()));

  //! External
  // final sharedPreferences = await SharedPreferences.getInstance();
  // sl.registerLazySingleton(() => sharedPreferences);
  sl.registerLazySingleton(() => http.Client());
  sl.registerLazySingleton(() => InternetConnectionChecker());
  sl.registerLazySingleton(() => RedisConnection());
  sl.registerFactory(
    () => GoogleSignIn(
      scopes: [
        'email',
        'https://www.googleapis.com/auth/contacts.readonly',
      ],
    ),
  );

  //! Utils - Router
  sl.registerLazySingleton(() => AppRouter());
}
