import 'package:dartz/dartz.dart';
import '../entitites/auth.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../repositories/auth_repository.dart';

class SilentLogin implements UseCase<Auth, NoParams> {
  final AuthRepository repository;

  SilentLogin(this.repository);

  @override
  Future<Either<Failure, Auth>> call(NoParams params) async {
    return repository.silentLogin();
  }
}
