import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'public_profile_state.dart';

class PublicProfileCubit extends Cubit<PublicProfileState> {
  PublicProfileCubit() : super(Initial());

  void getInterests() {
    emit(Loading());
    // final response;
    // response.fold();
  }
}
