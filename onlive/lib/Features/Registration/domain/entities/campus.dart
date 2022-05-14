// To parse this JSON data, do
//
//     final campus = campusFromJson(jsonString);

import 'dart:convert';

List<Campus> campusFromJson(String str) =>
    List<Campus>.from(json.decode(str).map((x) => Campus.fromJson(x)));

String campusToJson(List<Campus> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Campus {
  Campus({
    required this.id,
    required this.name,
    required this.v,
  });

  final String id;
  final String name;
  final int v;

  factory Campus.fromJson(Map<String, dynamic> json) => Campus(
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
