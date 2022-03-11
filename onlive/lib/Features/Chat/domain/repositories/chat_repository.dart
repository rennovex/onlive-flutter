import 'package:dartz/dartz.dart';
import 'package:onlive/Features/Chat/domain/entitites/chat.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/usecases/usecase.dart';

abstract class ChatRepository {
  Future<Either<Failure, NoParams>> postChat(Chat chat, int userId);
  Future<Either<Failure, List<Chat>>> getChats(int userId);
}
