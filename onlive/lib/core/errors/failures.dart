import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  @override
  List<Object?> get props => [];
}

// General failures

class ServerFailure extends Failure {}

class RedisFailure extends Failure {}

class CacheFailure extends Failure {}

class DataBaseFailure extends Failure {}

class LoginFailure extends Failure {}
