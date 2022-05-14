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

class FullNameChanged extends ReguserEvent {
  final String fullName;
  FullNameChanged({
    required this.fullName,
  });

  @override
  List<Object> get props => [fullName];
}

class AgeChanged extends ReguserEvent {
  final String age;
  AgeChanged({
    required this.age,
  });

  @override
  List<Object> get props => [age];
}

class GenderChanged extends ReguserEvent {
  final Gender gender;
  GenderChanged({
    required this.gender,
  });

  @override
  List<Object> get props => [gender];
}

class CampusSearchChanged extends ReguserEvent {
  final String search;

  CampusSearchChanged(this.search);

  @override
  List<Object> get props => [search];
}

class CampusSelected extends ReguserEvent {
  final Campus college;

  CampusSelected(this.college);

  @override
  List<Object> get props => [college];
}

class LoadCampuses extends ReguserEvent {
  @override
  List<Object> get props => [];
}

class InterestSelected extends ReguserEvent {
  final Interest interest;

  InterestSelected(this.interest) {
    print(interest);
  }

  @override
  List<Object> get props => [interest];
}

class DomainSelected extends ReguserEvent {
  final Domain domain;

  DomainSelected(this.domain);

  @override
  List<Object> get props => [domain];
}

class LoadInterests extends ReguserEvent {
  @override
  List<Object> get props => [];
}

class RegistrationComplete extends ReguserEvent {
  @override
  List<Object> get props => [];
}

class PublicProfileComplete extends ReguserEvent {
  @override
  List<Object> get props => [];
}

class Error extends ReguserEvent {
  @override
  List<Object> get props => [];
}
