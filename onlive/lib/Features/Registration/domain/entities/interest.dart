// To parse this JSON data, do
//
//     final interest = interestFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

List<Interest> interestFromJson(String str) =>
    List<Interest>.from(json.decode(str).map((x) => Interest.fromJson(x)));

String interestToJson(List<Interest> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Interest {
  Interest({
    required this.id,
    required this.name,
    required this.v,
  });

  final String id;
  final String name;
  final int v;

  factory Interest.fromJson(Map<String, dynamic> json) => Interest(
        id: json["_id"],
        name: json["name"],
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "__v": v,
      };
}
