part of 'avatar_select_cubit.dart';

abstract class AvatarSelectState extends Equatable {
  const AvatarSelectState();

  @override
  List<Object> get props => [];
}

class AvatarSelectInitial extends AvatarSelectState {}

class Loading extends AvatarSelectState {}

class Loaded extends AvatarSelectState {
  List<Avatar> avatars;
  Loaded({
    required this.avatars,
  });
}

class Error extends AvatarSelectState {}
