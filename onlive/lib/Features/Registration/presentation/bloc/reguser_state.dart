part of 'reguser_bloc.dart';

enum PageStatus { Initial, Loading, Loaded, Error, Complete }

class ReguserState extends Equatable {
  String nickname;
  String imageUrl;
  String image;
  String fullName;
  int age;
  String email;
  Gender gender;
  Domain domain;
  Campus college;

  String searchCampus;

  List<Interest> interests;
  List<Campus> campuses;
  List<Interest> selectedInterests;

  PageStatus avatarSelectionPageState;
  PageStatus publicProfilePageState;
  PageStatus collegeSelectionPageState;

  ReguserState({
    required this.nickname,
    required this.imageUrl,
    required this.image,
    required this.fullName,
    required this.age,
    required this.email,
    required this.gender,
    required this.domain,
    required this.college,
    required this.searchCampus,
    required this.interests,
    required this.campuses,
    required this.selectedInterests,
    required this.avatarSelectionPageState,
    required this.publicProfilePageState,
    required this.collegeSelectionPageState,
  });

  @override
  List<Object> get props => [
        nickname,
        selectedInterests,
        imageUrl,
        image,
        fullName,
        age,
        email,
        gender,
        college,
        domain,
        campuses,
        avatarSelectionPageState,
        collegeSelectionPageState,
        publicProfilePageState,
      ];

  ReguserState copyWith({
    String? nickname,
    List<Interest>? selectedInterests,
    String? imageUrl,
    String? image,
    String? fullName,
    int? age,
    String? email,
    Gender? gender,
    Domain? domain,
    Campus? college,
    String? searchCampus,
    List<Interest>? interests,
    List<Campus>? campuses,
    PageStatus? avatarSelectionPageState,
    PageStatus? collegeSelectionPageState,
    PageStatus? publicProfilePageState,
  }) {
    return ReguserState(
      nickname: nickname ?? this.nickname,
      selectedInterests: selectedInterests ?? this.selectedInterests,
      imageUrl: imageUrl ?? this.imageUrl,
      image: image ?? this.image,
      fullName: fullName ?? this.fullName,
      age: age ?? this.age,
      email: email ?? this.email,
      gender: gender ?? this.gender,
      domain: domain ?? this.domain,
      college: college ?? this.college,
      searchCampus: searchCampus ?? this.searchCampus,
      interests: interests ?? this.interests,
      campuses: campuses ?? this.campuses,
      avatarSelectionPageState:
          avatarSelectionPageState ?? this.avatarSelectionPageState,
      collegeSelectionPageState:
          collegeSelectionPageState ?? this.collegeSelectionPageState,
      publicProfilePageState:
          publicProfilePageState ?? this.publicProfilePageState,
    );
  }
}
