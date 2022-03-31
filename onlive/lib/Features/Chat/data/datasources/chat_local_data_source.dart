import 'package:onlive/core/db/chats_database.dart';

import '../../domain/entitites/chat.dart';
import '../../../../core/usecases/usecase.dart';

abstract class ChatLocalDataSource {
  /// Calls the http://numbersapi.com/{number} endpoint.
  ///
  /// Throws a [ServerException] for all error codes.
  Future<NoParams> saveChat(Chat chat);

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
  Future<NoParams> saveChat(Chat chat) async {
    final result = await ChatsDatabase.instance.create(chat);
  }
}
