import 'dart:convert';

import 'package:onlive/core/errors/failures.dart';
import 'package:onlive/dummy_data.dart';

import '../../domain/entitites/chat.dart';
import '../../domain/usecase/post_chat.dart';
import 'package:http/http.dart' as http;
import '../../../../core/usecases/usecase.dart';

abstract class ChatRemoteDataSource {
  /// Calls the http://numbersapi.com/{number} endpoint.
  ///
  /// Throws a [ServerException] for all error codes.
  Future<Chat> postChat(Chat chat);

  /// Calls the http://numbersapi.com/random endpoint.
  ///
  /// Throws a [ServerException] for all error codes.
  // Future<NumberTriviaModel> getRandomNumberTrivia();
}

class ChatRemoteDataSourceImpl implements ChatRemoteDataSource {
  final http.Client client;
  static const host =
      'http://onlive-nodejs-env-retry.eba-a7yme2is.ap-south-1.elasticbeanstalk.com';

  ChatRemoteDataSourceImpl({required this.client});

  @override
  Future<Chat> postChat(Chat chat) async {
    final url = '$host/api/users/messages/send/$TOUSERID';
    final response = await client.post(Uri.parse(url),
        headers: {'Content-Type': 'application/json', 'x-auth-token': '$XAUTH'},
        body: jsonEncode({'body': '${chat.body}'}));

    if (response.statusCode == 201) {
      print(response.body);
      return chatFromJson(response.body);
    } else {
      print(response.statusCode);
      print(response.body);
      print(response.reasonPhrase);

      throw ServerFailure();
    }
  }
}
