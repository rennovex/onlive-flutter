part of 'reg_user_cubit.dart';

class RegUserState extends Equatable {
  String nickname;
  String interest;
  String imageUrl;
  String image;
  String fullName;
  int age;
  String email;
  String gender;
  String domain;
  String college;

  RegUserState({
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
  });

  @override
  List<Object> get props =>
      [nickname, interest, imageUrl, image, fullName, age, email, gender];

  RegUserState copyWith({
    String? nickname,
    String? interest,
    String? imageUrl,
    String? image,
    String? fullName,
    int? age,
    String? email,
    String? gender,
    String? domain,
    String? college,
  }) {
    return RegUserState(
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
    );
  }
}
