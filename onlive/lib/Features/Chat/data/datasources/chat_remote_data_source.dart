import 'dart:convert';

import '../../domain/entitites/chat.dart';
import '../../domain/usecase/post_chat.dart';
import 'package:http/http.dart' as http;
import '../../../../core/usecases/usecase.dart';

abstract class ChatRemoteDataSource {
  /// Calls the http://numbersapi.com/{number} endpoint.
  ///
  /// Throws a [ServerException] for all error codes.
  Future<NoParams> postChat(Chat chat);

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
  Future<NoParams> postChat(Chat chat) async {
    final url = '$host/api/users/messages/send/61f6c11ccf62e86900d39a57';
    final response = await client.post(Uri.parse(url),
        headers: {
          'Content-Type': 'application/json',
          'x-auth-token':
              'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjYxZjU2Y2RiZjJkNjcyZWUxNDQwNGZhNyIsImlzQWRtaW4iOmZhbHNlLCJkb21haW4iOiJjYW1wdXMiLCJjYW1wdXMiOiI2MWY1NWVmNTllMzlkNzg3NmZmMzU3NGQiLCJpYXQiOjE2NDM1MTIxMDV9.5-J_eiCZJbtOPII_zvOC9kYU7Idb8pnBxWMubogoFfM'
        },
        body: jsonEncode({'body': '${chat.message}'}));

    if (response.statusCode == 201) {
      print(response.body);
    } else {
      print(response.statusCode);
      print(response.body);
      print(response.reasonPhrase);

      // throw ServerException();
    }
    return NoParams();
  }
}
