import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../entitites/chat.dart';

abstract class ChatRepository {
  Future<Either<Failure, NoParams>> postChat(Chat chat, String userId);
  Future<Either<Failure, NoParams>> saveChat(Chat chat, String userId);
  Future<Either<Failure, List<Chat>>> getChats(String userId);
  Future<Either<Failure, List<Chat>>> readFromChat(String userId);
  Future<Either<Failure, Stream<dynamic>>> listenToRedis();
}
