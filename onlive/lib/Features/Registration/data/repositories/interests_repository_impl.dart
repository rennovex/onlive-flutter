import 'package:onlive/Features/Registration/domain/entities/interest.dart';
import 'package:dartz/dartz.dart';
import 'package:onlive/Features/Registration/domain/repositories/interest_repository.dart';
import 'package:onlive/core/errors/failures.dart';

class InterestsRepositoryImpl implements InterestsRepository {
  @override
  Future<Either<Failure, List<Interest>>> getInterests() {
    // TODO: implement getInterests
    throw UnimplementedError();
  }
}
