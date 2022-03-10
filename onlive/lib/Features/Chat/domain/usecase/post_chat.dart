import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:onlive/Features/Chat/domain/entitites/chat.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../repositories/chat_repository.dart';

class PostChat implements UseCase<NoParams, Params> {
  final ChatRepository repository;

  PostChat(this.repository);

  @override
  Future<Either<Failure, NoParams>> call(Params params) async {
    return await repository.postChat(params.chat);
  }
}

class Params extends Equatable {
  final Chat chat;

  Params({required this.chat});

  @override
  List<Object> get props => [chat];
}
