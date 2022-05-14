import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:onlive/Features/Registration/domain/entities/campus.dart';
import 'package:onlive/Features/Registration/domain/usecases/get_campus.dart';
import 'package:onlive/Features/Registration/domain/usecases/get_interests.dart';
import 'package:onlive/core/usecases/usecase.dart';

import '../../../../Utils/constants/enum.dart';
import '../../domain/entities/interest.dart';

part 'reguser_event.dart';
part 'reguser_state.dart';

class ReguserBloc extends Bloc<ReguserEvent, ReguserState> {
  final GetInterests getInterests;
  final GetColleges getColleges;
  ReguserBloc(
    this.getInterests,
    this.getColleges,
  ) : super(
          ReguserState(
            nickname: '',
            age: -1,
            selectedInterests: [],
            avatarSelectionPageState: PageStatus.Initial,
            fullName: '',
            college: Campus(id: '', name: '', v: 1),
            email: '',
            gender: Gender.Male,
            domain: Domain.Campus,
            collegeSelectionPageState: PageStatus.Initial,
            image: '',
            imageUrl: '',
            interests: [],
            searchCampus: '',
            campuses: [],
            publicProfilePageState: PageStatus.Initial,
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
    on<LoadCampuses>(_onLoadCampuses);
    on<CampusSearchChanged>(_onCampusSearchChanged);
    on<CampusSelected>(_onCampusSelected);
    on<RegistrationComplete>(_onRegistrationComplete);
  }

  FutureOr<void> _onNicknameChanged(
      NicknameChanged event, Emitter<ReguserState> emit) {
    print(event.nickname);
    emit(state.copyWith(nickname: event.nickname));
  }

  FutureOr<void> _onInterestSelected(
      InterestSelected event, Emitter<ReguserState> emit) {
    emit(state.copyWith(publicProfilePageState: PageStatus.Initial));
    List<Interest> interests = state.selectedInterests;

    interests.contains(event.interest)
        ? interests.remove(event.interest)
        : interests.add(event.interest);

    emit(state.copyWith(
      selectedInterests: interests,
      publicProfilePageState: PageStatus.Loaded,
    ));
    print(state.selectedInterests);
  }

  FutureOr<void> _onLoadInterests(
      LoadInterests event, Emitter<ReguserState> emit) async {
    emit(state.copyWith(avatarSelectionPageState: PageStatus.Loading));
    final result = await getInterests(NoParams());
    result.fold((l) => print(l), (r) {
      emit(state.copyWith(
          avatarSelectionPageState: PageStatus.Loaded, interests: r));
    });
  }

  FutureOr<void> _onPublicProfileComplete(
      PublicProfileComplete event, Emitter<ReguserState> emit) async {
    if (state.selectedInterests == null || state.nickname == '')
      emit(state.copyWith(avatarSelectionPageState: PageStatus.Error));
    else
      emit(state.copyWith(avatarSelectionPageState: PageStatus.Complete));
  }

  FutureOr<void> _onFullNameChanged(
      FullNameChanged event, Emitter<ReguserState> emit) {
    emit(state.copyWith(fullName: event.fullName));
  }

  FutureOr<void> _onAgeChanged(AgeChanged event, Emitter<ReguserState> emit) {
    int age = int.parse(event.age == '' ? '0' : event.age);
    emit(state.copyWith(age: age));
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
    //TODO: Api Call
    print(state.nickname);
    print(state.fullName);
    print(state.age);
    print(state.email);
    print(state.gender);
    print(state.domain);
    print(state.college.name);
  }

  FutureOr<void> _onLoadCampuses(
      LoadCampuses event, Emitter<ReguserState> emit) async {
    emit(state.copyWith(collegeSelectionPageState: PageStatus.Loading));
    final result = await getColleges(NoParams());
    result.fold((l) => print(l), (r) {
      print(r);
      return emit(state.copyWith(
          collegeSelectionPageState: PageStatus.Loaded, campuses: r));
    });
  }
}
