part of 'auth_cubit.dart';

@immutable
abstract class AuthState {}

class AuthInitial extends AuthState {}

class Authenticated extends AuthState {
  final Auth auth;

  Authenticated(this.auth);
}

class Loading extends AuthState {}

class UnAuthenticated extends AuthState {}

class UnRegistered extends AuthState {}
