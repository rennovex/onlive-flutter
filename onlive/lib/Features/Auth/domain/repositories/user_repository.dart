import 'package:dartz/dartz.dart';
import 'package:onlive/Features/Auth/domain/entitites/auth.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/usecases/usecase.dart';

abstract class UserRepository {
  Future<Either<Failure, Auth>> postLogin();
  Future<Either<Failure, NoParams>> logout();
}
