import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:onlive/Features/Chat/domain/entitites/chat.dart';
import 'package:onlive/Features/Chat/domain/repositories/chat_repository.dart';
import 'package:onlive/core/errors/failures.dart';
import 'package:onlive/core/usecases/usecase.dart';

class GetChats implements UseCase<List<Chat>, Params> {
  final ChatRepository repository;

  GetChats(this.repository);

  @override
  Future<Either<Failure, List<Chat>>> call(Params params) async {
    return await repository.getChats(params.userId);
  }
}

class Params extends Equatable {
  final int userId;

  Params({required this.userId});

  @override
  List<Object> get props => [userId];
}
