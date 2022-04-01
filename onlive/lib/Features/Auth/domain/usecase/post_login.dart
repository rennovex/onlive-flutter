import 'package:dartz/dartz.dart';
import '../entitites/auth.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../repositories/user_repository.dart';

class PostLogin implements UseCase<Auth, NoParams> {
  final UserRepository repository;

  PostLogin(this.repository);

  @override
  Future<Either<Failure, Auth>> call(NoParams params) async {
    return repository.postLogin();
  }
}
