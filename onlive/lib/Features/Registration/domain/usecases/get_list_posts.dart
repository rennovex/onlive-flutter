import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/interest.dart';
import '../repositories/interest_repository.dart';

class GetInterests implements UseCase<List<Interest>, NoParams> {
  final InterestsRepository repository;

  GetInterests(this.repository);

  @override
  Future<Either<Failure, List<Interest>>> call(NoParams params) async {
    return await repository.getInterests();
  }
}



// class Params extends Equatable {
//   final int postId;
//   const Params({
//     required this.postId,
//   });

//   @override
//   List<Object?> get props => [postId];
// }
