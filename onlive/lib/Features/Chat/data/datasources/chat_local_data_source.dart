import 'package:onlive/Features/Chat/domain/entitites/chat.dart';
import 'package:onlive/core/usecases/usecase.dart';

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
  Future<NoParams> saveChat(Chat chat) {
    // TODO: implement saveChat
    throw UnimplementedError();
  }
}
