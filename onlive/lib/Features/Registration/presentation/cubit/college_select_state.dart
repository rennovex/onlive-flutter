part of 'college_select_cubit.dart';

abstract class CollegeSelectState extends Equatable {
  const CollegeSelectState();

  @override
  List<Object> get props => [];
}

class CollegeSelectInitial extends CollegeSelectState {}

class Loading extends CollegeSelectState {}

class Loaded extends CollegeSelectState {}

class Error extends CollegeSelectState {}
