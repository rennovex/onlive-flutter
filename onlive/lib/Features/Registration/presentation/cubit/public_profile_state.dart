part of 'public_profile_cubit.dart';

abstract class PublicProfileState extends Equatable {
  const PublicProfileState();

  @override
  List<Object> get props => [];
}

class Initial extends PublicProfileState {}

class Loading extends PublicProfileState {}

class Loaded extends PublicProfileState {
  List<String> interests;
  Loaded({
    required this.interests,
  });
}

class Error extends PublicProfileState {}
