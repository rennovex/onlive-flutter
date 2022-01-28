import 'dart:convert';

class RegUser {
  RegUser({
    this.nickname,
    this.interest,
    this.imageUrl,
    this.image,
    this.fullName,
    this.age,
    this.email,
    this.gender,
  });

  String? nickname;
  String? interest;
  String? imageUrl;
  String? image;
  String? fullName;
  int? age;
  String? email;
  String? gender;
}
