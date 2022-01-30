part of 'reguser_bloc.dart';

abstract class ReguserEvent extends Equatable {
  const ReguserEvent();

  @override
  List<Object> get props => [];
}

class NicknameChanged extends ReguserEvent {
  final String nickname;

  NicknameChanged(this.nickname);

  @override
  List<Object> get props => [nickname];
}

class InterestSelected extends ReguserEvent {
  final interest;

  InterestSelected(this.interest);

  @override
  List<Object> get props => [interest];
}

class LoadInterests extends ReguserEvent {
  @override
  List<Object> get props => [];
}

class Error extends ReguserEvent {
  @override
  List<Object> get props => [];
}
