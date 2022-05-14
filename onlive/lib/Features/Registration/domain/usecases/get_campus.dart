import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/campus.dart';
import '../repositories/registration_repository.dart';

class GetColleges implements UseCase<List<Campus>, NoParams> {
  final RegistrationRepository repository;

  GetColleges(this.repository);

  @override
  Future<Either<Failure, List<Campus>>> call(NoParams params) async {
    return await repository.getCampuses();
  }
}
