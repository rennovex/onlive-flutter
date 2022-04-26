import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../entitites/chat.dart';
import '../repositories/chat_repository.dart';

class ReadFromChat implements UseCase<List<Chat>, Params> {
  final ChatRepository repository;

  ReadFromChat(this.repository);

  @override
  Future<Either<Failure, List<Chat>>> call(Params params) async {
    return await repository.readFromChat(params.userId);
  }
}

class Params extends Equatable {
  final String userId;

  Params({required this.userId});

  @override
  List<Object> get props => [userId];
}
