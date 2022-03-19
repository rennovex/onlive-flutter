import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:onlive/Features/Chat/domain/entitites/chat.dart';
import 'package:onlive/Features/Chat/domain/usecase/listen_to_redis.dart';
import 'package:onlive/Features/Chat/domain/usecase/save_chat.dart';
import 'package:onlive/core/redis/redis_service.dart';
import 'package:onlive/core/usecases/usecase.dart';

part 'redis_state.dart';

class RedisCubit extends Cubit<RedisState> {
  final ListenToRedis listenToRedis;
  final SaveChat saveChat;

  RedisCubit({
    required this.listenToRedis,
    required this.saveChat,
  }) : super(RedisInitial()) {
    _listenToRedis();
  }

  Future<void> _listenToRedis() async {
    await Future.delayed(Duration(seconds: 3));
    final result = await listenToRedis(NoParams());
    result.fold((failure) async {
      print(failure);
      await Future.delayed(Duration(seconds: 1));
      print('Retrying redis connection...');
      // _listenToRedis();
    }, (stream) {
      stream.listen((event) {
        emit(RedisNewEvents());
        print(event);
        emit(RedisListening());
      });
    });
  }
}
