import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;

import '../../../../core/errors/failures.dart';
import '../../domain/entitites/auth.dart';

abstract class AuthRemoteDataSource {
  /// Calls the http://numbersapi.com/{number} endpoint.
  ///
  /// Throws a [ServerException] for all error codes.
  Future<Either<Failure, Auth>> login(String google_auth_token);

  /// Calls the http://numbersapi.com/random endpoint.
  ///
  /// Throws a [ServerException] for all error codes.
  // Future<NumberTriviaModel> getRandomNumberTrivia();
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final http.Client client;
  static const host =
      'http://onlive-nodejs-env-retry.eba-a7yme2is.ap-south-1.elasticbeanstalk.com';

  AuthRemoteDataSourceImpl({required this.client});

  @override
  Future<Either<Failure, Auth>> login(String google_auth_token) async {
    final url = '$host/api/auth/login';
    final response = await client.post(Uri.parse(url), headers: {
      'Content-Type': 'application/json',
      'x-auth-google-token': '$google_auth_token'
    });

    if (response.statusCode == 200) {
      print(response.body);
      Auth auth = authFromJson(response.body);
      return Right(auth);
    } else {
      print(response.statusCode);
      print(response.body);
      print(response.reasonPhrase);
      return Left(ServerFailure());
      // throw ServerException();
    }
    // return ();
  }
}
