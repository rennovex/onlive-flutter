import 'package:dartz/dartz.dart';
import 'package:onlive/core/db/chats_database.dart';
import 'package:onlive/core/errors/failures.dart';

import '../../domain/entitites/chat.dart';
import '../../../../core/usecases/usecase.dart';

abstract class ChatLocalDataSource {
  /// Calls the Local Sqlite DataBase.
  ///
  /// Throws a [DataBaseFailure] for all error codes.
  Future<Either<DataBaseFailure, NoParams>> saveChat(Chat chat);

  /// Calls the Local Sqlite DataBase.
  ///
  /// Throws a [DataBaseFailure] for all error codes.
  Future<Either<DataBaseFailure, List<Chat>>> readAllChat(Chat chat);
}

class ChatLocalDataSourceImpl implements ChatLocalDataSource {
  @override
  Future<NoParams> postChat(Chat chat) {
    // TODO: implement postChat
    throw UnimplementedError();
  }

  @override
  Future<Either<DataBaseFailure, NoParams>> saveChat(Chat chat) async {
    try {
      await ChatsDatabase.instance.create(chat);
      return Right(NoParams());
    } catch (ex) {
      return Left(DataBaseFailure());
    }
  }

  @override
  Future<Either<DataBaseFailure, List<Chat>>> readAllChat(Chat chat) async {
    try {
      final result = await ChatsDatabase.instance.readAllChats();
      List<Chat> chats = chatFromListJson(result);
      return Right(chats);
    } catch (ex) {
      return Left(DataBaseFailure());
    }
  }
}
