import 'package:dartz/dartz.dart';
import '../entitites/auth.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/usecases/usecase.dart';

abstract class AuthRepository {
  Future<Either<Failure, Auth>> silentLogin();
  Future<Either<Failure, Auth>> postLogin();
  Future<Either<Failure, NoParams>> logout();
}
