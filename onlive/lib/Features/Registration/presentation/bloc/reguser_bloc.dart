import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:onlive/Features/Registration/domain/entities/interest.dart';

part 'reguser_event.dart';
part 'reguser_state.dart';

class ReguserBloc extends Bloc<ReguserEvent, ReguserState> {
  ReguserBloc()
      : super(
          ReguserState(
            nickname: '',
            age: -1,
            interest: '',
            avatarSelectionPageState: PageStatus.Initial,
            fullName: '',
            college: '',
            email: '',
            gender: '',
            domain: '',
            collegeSelectionPageState: PageStatus.Initial,
            image: '',
            imageUrl: '',
            interests: [],
          ),
        ) {
    // on<ReguserEvent>();
    on<NicknameChanged>(_onNicknameChanged);
    on<InterestSelected>(_onInterestSelected);
    on<LoadInterests>(_onLoadInterests);
  }

  FutureOr<void> _onNicknameChanged(
      NicknameChanged event, Emitter<ReguserState> emit) {
    emit(state.copyWith(nickname: event.nickname));
  }

  FutureOr<void> _onInterestSelected(
      InterestSelected event, Emitter<ReguserState> emit) {
    emit(state.copyWith(interest: event.interest));
  }

  FutureOr<void> _onLoadInterests(
      LoadInterests event, Emitter<ReguserState> emit) async {
    emit(state.copyWith(avatarSelectionPageState: PageStatus.Loading));
    // emit(state.copyWith(interest: event.interest));
    emit(state.copyWith(avatarSelectionPageState: PageStatus.Loaded));
  }
}
