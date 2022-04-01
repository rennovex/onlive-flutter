import 'package:dartz/dartz.dart';
import '../entitites/auth.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../repositories/user_repository.dart';

class Logout implements UseCase<NoParams, NoParams> {
  final UserRepository repository;

  Logout(this.repository);

  @override
  Future<Either<Failure, NoParams>> call(NoParams) async {
    return repository.logout();
  }
}
