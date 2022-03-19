import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../entitites/chat.dart';

abstract class ChatRepository {
  Future<Either<Failure, NoParams>> postChat(Chat chat, int userId);
  Future<Either<Failure, NoParams>> saveChat(Chat chat, int userId);
  Future<Either<Failure, List<Chat>>> getChats(int userId);
  Future<Either<Failure, Stream<dynamic>>> listenToRedis();
}
