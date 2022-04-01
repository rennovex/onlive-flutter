// To parse this JSON data, do
//
//     final chat = chatFromJson(jsonString);

import 'dart:convert';

Chat chatFromJson(String str) => Chat.fromJson(json.decode(str));

String chatToJson(Chat data) => json.encode(data.toJson());

List<Chat> chatFromListJson(String str) =>
    List<Chat>.from(json.decode(str).map((x) => Chat.fromJson(x)));

String chatToListJson(List<Chat> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Chat {
  Chat({
    required this.from,
    required this.to,
    required this.body,
    required this.status,
    required this.id,
    required this.timeStamp,
    required this.v,
  });

  String from;
  String to;
  String body;
  String status;
  String id;
  DateTime timeStamp;
  int v;

  factory Chat.fromJson(Map<String, dynamic> json) => Chat(
        from: json["from"],
        to: json["to"],
        body: json["body"],
        status: json["status"],
        id: json["_id"],
        timeStamp: DateTime.parse(json["timeStamp"]),
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "from": from,
        "to": to,
        "body": body,
        "status": status,
        "_id": id,
        "timeStamp": timeStamp.toIso8601String(),
        "__v": v,
      };
}

final String tableChats = 'chats';

class ChatFields {
  static final String id = '_id';
  static final String from = 'from';
  static final String to = 'to';
  static final String body = 'body';
  static final String status = 'status';
  static final String timeStamp = 'timeStamp';
  static final String v = '__v';
}
