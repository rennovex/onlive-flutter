import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import '../entitites/chat.dart';
import '../repositories/chat_repository.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/usecases/usecase.dart';

class ListenToRedis implements UseCase<dynamic, NoParams> {
  final ChatRepository repository;

  ListenToRedis(this.repository);

  @override
  Future<Either<Failure, Stream<dynamic>>> call(NoParams) {
    return repository.listenToRedis();
  }
}

// class Params extends Equatable {
//   final int userId;

//   Params({required this.userId});

//   @override
//   List<Object> get props => [userId];
// }
