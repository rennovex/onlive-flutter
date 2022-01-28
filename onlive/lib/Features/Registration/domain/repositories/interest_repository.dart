import 'package:dartz/dartz.dart';
import 'package:onlive/Features/Registration/domain/entities/interest.dart';

import '../../../../core/errors/failures.dart';

abstract class InterestsRepository {
  Future<Either<Failure, List<Interest>>> getInterests();
}
