import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../datasources/chat_local_data_source.dart';
import '../../../../core/redis/redis_service.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../../../../dummy_data.dart';
import '../../domain/entitites/chat.dart';
import '../../domain/repositories/chat_repository.dart';
import '../datasources/chat_remote_data_source.dart';

class ChatRepositoryImpl implements ChatRepository {
  final ChatRemoteDataSource remoteDataSource;
  final ChatLocalDataSource localDataSource;
  late StreamSubscription streamSubscription;
  final RedisService redisService;
  final StreamController<Chat> controller = StreamController<Chat>();

  ChatRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
    // required this.streamSubscription,
    required this.redisService,
  });
  // final ChatLocalDataSource remoteDataSource;

  @override
  Future<Either<Failure, NoParams>> postChat(Chat chat, String userId) async {
    print('Post chat triggered');

    // chats_user_1.add(chat);

    try {
      print('save Chat Triggered');
      final chat_response = await remoteDataSource.postChat(chat, userId);
      await localDataSource.saveChat(chat_response);
    } catch (exp) {
      print(exp);
    }

    return Right(NoParams());
  }

  @override
  Future<Either<Failure, List<Chat>>> getChats(String userId) async {
    // TODO: implement getChats
    // throw UnimplementedError();

    return await localDataSource.readAllChat();
  }

  @override
  Future<Either<Failure, Stream>> listenToRedis() async {
    Stream stream = controller.stream;
    try {
      streamSubscription =
          await redisService.pubsub.getStream().listen((event) {
        if (event[0] == 'subscribe') {
          print('subscription successful: Listening to ${event[1]} ...');
        }
        if (event[0] == 'message') {
          Chat chat = chatFromJson(event[2]);
          chats_user_1.add(chat);

          controller.add(chat);
        }
      });
      return Right(stream);
    } catch (ex) {
      print(ex);
      return Left(RedisFailure());
      //
    }

    // return Failure();
    // emit(RedisListening());
  }

  @override
  Future<Either<Failure, NoParams>> saveChat(Chat chat, String userId) async {
    chats_user_1.add(chat);
    return Right(NoParams());
  }

  @override
  Future<Either<Failure, List<Chat>>> readFromChat(String userId) async {
    return await localDataSource.readFromChat(userId);
  }
}
