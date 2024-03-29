import 'package:dartz/dartz.dart';
import '../entitites/auth.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../repositories/auth_repository.dart';

class PostLogin implements UseCase<Auth, NoParams> {
  final AuthRepository repository;

  PostLogin(this.repository);

  @override
  Future<Either<Failure, Auth>> call(NoParams params) async {
    return repository.postLogin();
  }
}
