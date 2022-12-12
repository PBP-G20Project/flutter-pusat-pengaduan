// To parse this JSON data, do
//
//     final adminReminder = adminReminderFromJson(jsonString);

import 'dart:convert';

List<AdminReminder> adminReminderFromJson(String str) => List<AdminReminder>.from(json.decode(str).map((x) => AdminReminder.fromJson(x)));

String adminReminderToJson(List<AdminReminder> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class AdminReminder {
  AdminReminder({
    required this.pk,
    required this.fields,
  });

  int pk;
  Fields fields;

  factory AdminReminder.fromJson(Map<String, dynamic> json) => AdminReminder(
    pk: json["pk"],
    fields: Fields.fromJson(json["fields"]),
  );

  Map<String, dynamic> toJson() => {
    "pk": pk,
    "fields": fields.toJson(),
  };
}

class Fields {
  Fields({
    this.admin,
    required this.title,
    required this.content,
    required this.status,
  });

  dynamic admin;
  String title;
  String content;
  String status;

  factory Fields.fromJson(Map<String, dynamic> json) => Fields(
    admin: json["admin"],
    title: json["title"],
    content: json["content"],
    status: json["status"],
  );

  Map<String, dynamic> toJson() => {
    "admin": admin,
    "title": title,
    "content": content,
    "status": status,
  };
}
