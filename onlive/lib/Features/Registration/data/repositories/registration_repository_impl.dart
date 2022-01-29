import 'package:onlive/Features/Registration/domain/entities/college.dart';

import '../../domain/entities/avatar.dart';
import '../../domain/entities/interest.dart';
import 'package:dartz/dartz.dart';
import '../../domain/repositories/registration_repository.dart';
import '../../../../core/errors/failures.dart';

class RegistrationRepositoryImpl implements RegistrationRepository {
  @override
  Future<Either<Failure, List<Interest>>> getInterests() {
    // TODO: implement getInterests
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<Avatar>>> getAvatars() {
    // TODO: implement getAvatars
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<College>>> getColleges() {
    // TODO: implement getColleges
    throw UnimplementedError();
  }
}
