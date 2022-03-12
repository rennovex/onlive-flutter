import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../../domain/entities/interest.dart';
import '../../../../Utils/constants/enum.dart';

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
            gender: Gender.Male,
            domain: '',
            collegeSelectionPageState: PageStatus.Initial,
            image: '',
            imageUrl: '',
            interests: [],
            searchCampus: '',
            colleges: [],
          ),
        ) {
    // on<ReguserEvent>();
    on<NicknameChanged>(_onNicknameChanged);
    on<InterestSelected>(_onInterestSelected);
    on<LoadInterests>(_onLoadInterests);
    on<PublicProfileComplete>(_onPublicProfileComplete);
    on<FullNameChanged>(_onFullNameChanged);
    on<AgeChanged>(_onAgeChanged);
    on<GenderChanged>(_onGenderChanged);
    on<DomainSelected>(_onDomainSelected);
    on<CampusSearchChanged>(_onCampusSearchChanged);
    on<CampusSelected>(_onCampusSelected);
    on<RegistrationComplete>(_onRegistrationComplete);
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

  FutureOr<void> _onPublicProfileComplete(
      PublicProfileComplete event, Emitter<ReguserState> emit) async {
    if (state.interest == null || state.nickname == '')
      emit(state.copyWith(avatarSelectionPageState: PageStatus.Error));
    else
      emit(state.copyWith(avatarSelectionPageState: PageStatus.Complete));
  }

  FutureOr<void> _onFullNameChanged(
      FullNameChanged event, Emitter<ReguserState> emit) {
    emit(state.copyWith(fullName: event.fullName));
  }

  FutureOr<void> _onAgeChanged(AgeChanged event, Emitter<ReguserState> emit) {
    emit(state.copyWith(age: event.age));
  }

  FutureOr<void> _onGenderChanged(
      GenderChanged event, Emitter<ReguserState> emit) {
    emit(state.copyWith(gender: event.gender));
  }

  FutureOr<void> _onDomainSelected(
      DomainSelected event, Emitter<ReguserState> emit) {
    emit(state.copyWith(domain: event.domain));
  }

  FutureOr<void> _onCampusSearchChanged(
      CampusSearchChanged event, Emitter<ReguserState> emit) {
    // TODO: campus search implementation
  }

  FutureOr<void> _onCampusSelected(
      CampusSelected event, Emitter<ReguserState> emit) {
    emit(state.copyWith(college: event.college));
  }

  FutureOr<void> _onRegistrationComplete(
      RegistrationComplete event, Emitter<ReguserState> emit) {
    // TODO: registration complete implementation
  }
}
