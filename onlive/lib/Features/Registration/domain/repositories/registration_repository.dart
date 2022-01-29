import 'package:dartz/dartz.dart';
import '../entities/avatar.dart';
import '../entities/college.dart';
import '../entities/interest.dart';

import '../../../../core/errors/failures.dart';

abstract class RegistrationRepository {
  Future<Either<Failure, List<Interest>>> getInterests();
  Future<Either<Failure, List<Avatar>>> getAvatars();
  Future<Either<Failure, List<College>>> getColleges();
}
