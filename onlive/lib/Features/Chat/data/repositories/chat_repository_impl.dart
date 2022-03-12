import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'package:onlive/core/redis/redis_service.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../../../../dummy_data.dart';
import '../../domain/entitites/chat.dart';
import '../../domain/repositories/chat_repository.dart';
import '../datasources/chat_remote_data_source.dart';

class ChatRepositoryImpl implements ChatRepository {
  final ChatRemoteDataSource remoteDataSource;
  late StreamSubscription streamSubscription;
  final RedisService redisService;

  ChatRepositoryImpl({
    required this.remoteDataSource,
    required this.redisService,
  });
  // final ChatLocalDataSource remoteDataSource;

  @override
  Future<Either<Failure, NoParams>> postChat(Chat chat, int userId) async {
    print('Post chat triggered');

    chats_user_1.add(chat);

    try {
      final response = await remoteDataSource.postChat(chat);
    } catch (exp) {
      print(exp);
    }

    return Right(NoParams());
  }

  @override
  Future<Either<Failure, List<Chat>>> getChats(int userId) async {
    // TODO: implement getChats
    // throw UnimplementedError();
    if (userId == 1)
      return Right(chats_user_1);
    else
      return Right(chats_user_2);
  }

  @override
  Future<Either<Failure, Stream>> listenToRedis() async {
    try {
      final Stream redisStream = await redisService.pubsub.getStream();
      return Right(redisStream);
    } catch (ex) {
      print(ex);
      return Left(RedisFailure());
      //
    }

    // return Failure();
    // emit(RedisListening());
  }
}
