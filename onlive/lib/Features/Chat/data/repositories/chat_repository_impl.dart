import 'package:dartz/dartz.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:onlive/Features/Chat/domain/entitites/chat.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../../domain/repositories/chat_repository.dart';

class ChatRepositoryImpl implements ChatRepository {
  @override
  Future<Either<Failure, NoParams>> postChat(Chat chat) async {
    // TODO: implement postChat
    // throw UnimplementedError();
    print('Post chat triggered');
    return Right(NoParams());
  }
}
