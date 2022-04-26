import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:http/http.dart' as http;
import 'package:onlive/Features/Auth/data/datasources/auth_local_data_source.dart';
import 'package:onlive/Features/Auth/domain/usecase/silent_login.dart';
import 'package:onlive/Features/Chat/domain/usecase/read_from_chat.dart';
import 'package:onlive/core/Global/global.dart';
import 'package:onlive/core/push_notifications/fcm.dart';
import 'package:onlive/core/secure_storage/secure_storage.dart';
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

import 'Features/Auth/data/repositories/auth_repository_impl.dart';
import 'Features/Auth/domain/repositories/auth_repository.dart';
import 'Features/Auth/domain/usecase/post_login.dart';
import 'Features/Auth/presentation/cubit/auth_cubit.dart';
import 'core/network/network_info.dart';

final sl = GetIt.instance;

Future<void> init() async {
  //! Features - Auth
  // Bloc
  sl.registerFactory(
    () => AuthCubit(postLogin: sl(), logout: sl(), silentLogin: sl()),
  );

  //UseCases
  sl.registerLazySingleton(() => PostLogin(sl()));
  sl.registerLazySingleton(() => Logout(sl()));
  sl.registerLazySingleton(() => SilentLogin(sl()));

  // Repository
  sl.registerLazySingleton<AuthRepository>(
      () => UserRepositoryImpl(sl(), sl(), sl()));

  // Data sources
  sl.registerLazySingleton<AuthRemoteDataSource>(
    () => AuthRemoteDataSourceImpl(
      client: sl(),
    ),
  );

  sl.registerLazySingleton<AuthLocalDataSource>(
      () => AuthLocalDataSourceImpl(secureStorage: sl()));

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
  sl.registerFactory(
      () => ChatBloc(postChat: sl(), getChats: sl(), readFromChat: sl()));

  sl.registerLazySingleton(() => PostChat(sl()));
  sl.registerLazySingleton(() => GetChats(sl()));
  sl.registerLazySingleton(() => ReadFromChat(sl()));
  sl.registerLazySingleton(() => ListenToRedis(sl()));
  sl.registerLazySingleton(() => SaveChat(sl()));

  // Repository
  sl.registerLazySingleton<ChatRepository>(() => ChatRepositoryImpl(
        remoteDataSource: sl(),
        localDataSource: sl(),
        redisService: sl(),
      ));
  sl.registerLazySingleton<ChatRemoteDataSource>(
      () => ChatRemoteDataSourceImpl(client: sl(), storage: sl()));
  sl.registerLazySingleton<ChatLocalDataSource>(
      () => ChatLocalDataSourceImpl(storage: sl()));
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

  // sl.registerFactory<Fcm>(() => Fcm(sl()));
  sl.registerLazySingleton<FlutterSecureStorage>(() => FlutterSecureStorage());
  sl.registerFactory<RedisService>(
      () => RedisService(conn: sl(), storage: sl()));

  //! External
  // final sharedPreferences = await SharedPreferences.getInstance();
  // sl.registerLazySingleton(() => sharedPreferences);
  sl.registerLazySingleton(() => http.Client());
  // sl.registerLazySingleton(() => FirebaseMessaging.instance);
  sl.registerLazySingleton(() => InternetConnectionChecker());
  sl.registerLazySingleton(() => SecureStorage(storage: sl()));
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
