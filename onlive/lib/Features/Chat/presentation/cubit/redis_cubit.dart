import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:onlive/Features/Chat/domain/usecase/listen_to_redis.dart';
import 'package:onlive/core/redis/redis_service.dart';
import 'package:onlive/core/usecases/usecase.dart';

part 'redis_state.dart';

class RedisCubit extends Cubit<RedisState> {
  final ListenToRedis listenToRedis;

  RedisCubit({
    required this.listenToRedis,
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
        print(event);
        if (event[0] == 'subscribe')
          print('subscription successful: Listening to ${event[1]} ...');
        if (event[0] == 'message') print('message: ${event[2]}');
      });
    });
  }
}
