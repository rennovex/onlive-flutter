import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../repositories/user_repository.dart';

class PostLogin implements UseCase<NoParams, NoParams> {
  final UserRepository repository;

  PostLogin(this.repository);

  @override
  Future<Either<Failure, NoParams>> call(NoParams params) async {
    return await repository.postLogin();
  }
}
