import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../entities/avatar.dart';
import '../entities/campus.dart';
import '../entities/interest.dart';

abstract class RegistrationRepository {
  Future<Either<Failure, List<Interest>>> getInterests();
  Future<Either<Failure, List<Avatar>>> getAvatars();
  Future<Either<Failure, List<Campus>>> getCampuses();
}
