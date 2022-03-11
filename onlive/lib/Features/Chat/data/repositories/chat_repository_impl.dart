import 'package:dartz/dartz.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:onlive/Features/Chat/data/datasources/chat_remote_data_source.dart';
import 'package:onlive/Features/Chat/domain/entitites/chat.dart';
import 'package:onlive/dummy_data.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../../domain/repositories/chat_repository.dart';

class ChatRepositoryImpl implements ChatRepository {
  final ChatRemoteDataSource remoteDataSource;

  ChatRepositoryImpl({required this.remoteDataSource});
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
}
