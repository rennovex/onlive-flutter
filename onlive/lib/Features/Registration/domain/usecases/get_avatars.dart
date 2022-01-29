import 'package:dartz/dartz.dart';
import '../entities/avatar.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../repositories/registration_repository.dart';

class GetAvatars implements UseCase<List<Avatar>, NoParams> {
  final RegistrationRepository repository;

  GetAvatars(this.repository);

  @override
  Future<Either<Failure, List<Avatar>>> call(NoParams params) async {
    return await repository.getAvatars();
  }
}
