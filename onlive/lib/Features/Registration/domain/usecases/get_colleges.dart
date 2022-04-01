import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/college.dart';
import '../repositories/registration_repository.dart';

class GetColleges implements UseCase<List<College>, NoParams> {
  final RegistrationRepository repository;

  GetColleges(this.repository);

  @override
  Future<Either<Failure, List<College>>> call(NoParams params) async {
    return await repository.getColleges();
  }
}
