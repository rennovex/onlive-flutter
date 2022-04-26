import 'dart:convert';

import 'package:onlive/core/secure_storage/secure_storage.dart';

import '../../../../core/errors/failures.dart';
import '../../../../dummy_data.dart';

import '../../domain/entitites/chat.dart';
import '../../domain/usecase/post_chat.dart';
import 'package:http/http.dart' as http;
import '../../../../core/usecases/usecase.dart';

abstract class ChatRemoteDataSource {
  /// Calls the http://numbersapi.com/{number} endpoint.
  ///
  /// Throws a [ServerException] for all error codes.
  Future<Chat> postChat(Chat chat, String userId);

  /// Calls the http://numbersapi.com/random endpoint.
  ///
  /// Throws a [ServerException] for all error codes.
  // Future<NumberTriviaModel> getRandomNumberTrivia();
}

class ChatRemoteDataSourceImpl implements ChatRemoteDataSource {
  final http.Client client;
  final SecureStorage storage;
  static const host =
      'http://onlive-nodejs-dev2.ap-south-1.elasticbeanstalk.com';

  ChatRemoteDataSourceImpl({required this.client, required this.storage});

  @override
  Future<Chat> postChat(Chat chat, String userId) async {
    final String token = await storage.readToken();
    final url = '$host/api/users/messages/send/$userId';
    final response = await client.post(Uri.parse(url),
        headers: {'Content-Type': 'application/json', 'x-auth-token': token},
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
