part of 'reguser_bloc.dart';

enum PageStatus { Initial, Loading, Loaded, Error, Complete }

class ReguserState extends Equatable {
  String nickname;
  String interest;
  String imageUrl;
  String image;
  String fullName;
  int age;
  String email;
  Gender gender;
  String domain;
  String college;

  String searchCampus;

  List<Interest> interests;
  List<String> colleges;

  PageStatus avatarSelectionPageState;
  PageStatus collegeSelectionPageState;

  ReguserState({
    required this.nickname,
    required this.interest,
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
    required this.colleges,
    required this.avatarSelectionPageState,
    required this.collegeSelectionPageState,
  });

  @override
  List<Object> get props => [];

  ReguserState copyWith({
    String? nickname,
    String? interest,
    String? imageUrl,
    String? image,
    String? fullName,
    int? age,
    String? email,
    Gender? gender,
    String? domain,
    String? college,
    String? searchCampus,
    List<Interest>? interests,
    List<String>? colleges,
    PageStatus? avatarSelectionPageState,
    PageStatus? collegeSelectionPageState,
  }) {
    return ReguserState(
      nickname: nickname ?? this.nickname,
      interest: interest ?? this.interest,
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
      colleges: colleges ?? this.colleges,
      avatarSelectionPageState:
          avatarSelectionPageState ?? this.avatarSelectionPageState,
      collegeSelectionPageState:
          collegeSelectionPageState ?? this.collegeSelectionPageState,
    );
  }
}
