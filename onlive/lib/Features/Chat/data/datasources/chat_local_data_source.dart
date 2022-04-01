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

  /// Calls the http://numbersapi.com/random endpoint.
  ///
  /// Throws a [ServerException] for all error codes.
  // Future<NumberTriviaModel> getRandomNumberTrivia();
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
}
