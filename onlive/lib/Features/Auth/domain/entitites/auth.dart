// To parse this JSON data, do
//
//     final auth = authFromJson(jsonString);

import 'dart:convert';

Auth authFromJson(String str) => Auth.fromJson(json.decode(str));

String authToJson(Auth data) => json.encode(data.toJson());

class Auth {
  Auth({
    required this.id,
    required this.nickname,
    required this.avatar,
    required this.interests,
    required this.xAuthToken,
  });

  String id;
  String nickname;
  Avatar avatar;
  List<Avatar> interests;
  String xAuthToken;

  factory Auth.fromJson(Map<String, dynamic> json) => Auth(
        id: json["_id"],
        nickname: json["nickname"],
        avatar: Avatar.fromJson(json["avatar"]),
        interests:
            List<Avatar>.from(json["interests"].map((x) => Avatar.fromJson(x))),
        xAuthToken: json["x-auth-token"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "nickname": nickname,
        "avatar": avatar.toJson(),
        "interests": List<dynamic>.from(interests.map((x) => x.toJson())),
        "x-auth-token": xAuthToken,
      };
}

class Avatar {
  Avatar({
    required this.id,
    required this.name,
    required this.url,
    required this.v,
  });

  String id;
  String name;
  String url;
  int v;

  factory Avatar.fromJson(Map<String, dynamic> json) => Avatar(
        id: json["_id"],
        name: json["name"],
        url: json["url"] == null ? '' : json["url"],
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "url": url == null ? '' : url,
        "__v": v,
      };
}
