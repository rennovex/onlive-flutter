import 'package:dartz/dartz.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:onlive/Features/Chat/domain/entitites/chat.dart';
import 'package:onlive/dummy_data.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../../domain/repositories/chat_repository.dart';

class ChatRepositoryImpl implements ChatRepository {
  @override
  Future<Either<Failure, NoParams>> postChat(Chat chat, int userId) async {
    // TODO: implement postChat
    // throw UnimplementedError();
    print('Post chat triggered');
    if (userId == 1)
      chats_user_1.add(chat);
    else
      chats_user_2.add(chat);
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
}
