import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../entitites/chat.dart';
import '../repositories/chat_repository.dart';

class PostChat implements UseCase<NoParams, Params> {
  final ChatRepository repository;

  PostChat(this.repository);

  @override
  Future<Either<Failure, NoParams>> call(Params params) async {
    return await repository.postChat(params.chat, params.userId);
  }
}

class Params extends Equatable {
  final Chat chat;
  final String userId;

  Params({required this.userId, required this.chat});

  @override
  List<Object> get props => [chat];
}
