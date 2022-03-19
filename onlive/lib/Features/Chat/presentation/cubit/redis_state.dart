part of 'redis_cubit.dart';

abstract class RedisState extends Equatable {
  const RedisState();

  @override
  List<Object> get props => [];
}

class RedisInitial extends RedisState {}

class RedisNewEvents extends RedisState {
  // final Chat chat;

  RedisNewEvents();
}

class RedisListening extends RedisState {}

class RedisError extends RedisState {}
