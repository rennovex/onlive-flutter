import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'college_select_state.dart';

class CollegeSelectCubit extends Cubit<CollegeSelectState> {
  CollegeSelectCubit() : super(CollegeSelectInitial());

  void loadColleges() async {
    emit(Loading());
  }
}
