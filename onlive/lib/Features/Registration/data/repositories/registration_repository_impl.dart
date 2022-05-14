import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;

import '../../../../constants.dart';
import '../../../../core/errors/failures.dart';
import '../../domain/entities/avatar.dart';
import '../../domain/entities/campus.dart';
import '../../domain/entities/interest.dart';
import '../../domain/repositories/registration_repository.dart';

class RegistrationRepositoryImpl implements RegistrationRepository {
  final http.Client client;
  RegistrationRepositoryImpl({
    required this.client,
  });

  @override
  Future<Either<Failure, List<Interest>>> getInterests() async {
    final url = '$host/api/users/interests';
    final response = await client.get(
      Uri.parse(url),
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 200) {
      print(response.body);
      return Right(interestFromJson(response.body));
    } else {
      print(response.statusCode);
      print(response.body);
      print(response.reasonPhrase);

      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, List<Avatar>>> getAvatars() async {
    final url = '$host/api/users/interests';
    final response = await client.get(
      Uri.parse(url),
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 200) {
      print(response.body);
      return Right([]);
    } else {
      print(response.statusCode);
      print(response.body);
      print(response.reasonPhrase);

      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, List<Campus>>> getCampuses() async {
    final url = '$host/api/users/campuses';
    final response = await client.get(
      Uri.parse(url),
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 200) {
      print(response.body);
      return Right(campusFromJson(response.body));
    } else {
      print(response.statusCode);
      print(response.body);
      print(response.reasonPhrase);

      return Left(ServerFailure());
    }
  }
}
