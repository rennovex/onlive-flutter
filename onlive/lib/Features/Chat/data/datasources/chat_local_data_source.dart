import 'dart:convert';

import 'package:dartz/dartz.dart';

import 'package:onlive/core/secure_storage/secure_storage.dart';

import '../../../../core/db/chats_database.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../../domain/entitites/chat.dart';

abstract class ChatLocalDataSource {
  /// Calls the Local Sqlite DataBase.
  ///
  /// Throws a [DataBaseFailure] for all error codes.
  Future<Either<Failure, NoParams>> saveChat(Chat chat);

  /// Calls the Local Sqlite DataBase.
  ///
  /// Throws a [DataBaseFailure] for all error codes.
  Future<Either<Failure, List<Chat>>> readAllChat();

  /// Calls the Local Sqlite DataBase.
  ///
  /// Throws a [DataBaseFailure] for all error codes.
  Future<Either<Failure, List<Chat>>> readFromChat(String userId);
}

class ChatLocalDataSourceImpl implements ChatLocalDataSource {
  final SecureStorage storage;
  ChatLocalDataSourceImpl({
    required this.storage,
  });

  @override
  Future<NoParams> postChat(Chat chat) {
    // TODO: implement postChat
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, NoParams>> saveChat(Chat chat) async {
    try {
      chat..id = '${DateTime.now()}';
      await ChatsDatabase.instance.create(chat);
      return Right(NoParams());
    } catch (ex) {
      return Left(DataBaseFailure());
    }
  }

  @override
  Future<Either<Failure, List<Chat>>> readAllChat() async {
    try {
      final result = await ChatsDatabase.instance.readAllChats();
      print('Parsing Time');

      List<Chat> chats = chatFromListJson(result);
      print('chats parsed: ' + chats.toString());
      // print('chats in local: ' + chats.toString());
      return Right(chats);
    } catch (ex) {
      print(ex);

      return Left(DataBaseFailure());
    }
  }

  @override
  Future<Either<Failure, List<Chat>>> readFromChat(String userId) async {
    try {
      final result = await ChatsDatabase.instance.readFromChat(userId);
      print('Parsing Time');

      List<Chat> chats = chatFromListJson(result);
      print('chats parsed: ' + chats.toString());

      return Right(chats);
    } catch (ex) {
      print(ex);

      return Left(DataBaseFailure());
    }
  }
}
