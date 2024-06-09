// To parse this JSON data, do
//
//     final notificationApi = notificationApiFromJson(jsonString);

import 'dart:convert';

List<NotificationApi> notificationApiFromJson(String str) =>
    List<NotificationApi>.from(
        json.decode(str).map((x) => NotificationApi.fromJson(x)));

String notificationApiToJson(List<NotificationApi> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class NotificationApi {
  int id;
  String createdAt;
  String updatedAt;
  String title;
  String message;

  NotificationApi({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.title,
    required this.message,
  });

  factory NotificationApi.fromJson(Map<String, dynamic> json) =>
      NotificationApi(
        id: json["id"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
        title: json["title"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "created_at": createdAt,
        "updated_at": updatedAt,
        "title": title,
        "message": message,
      };
}
