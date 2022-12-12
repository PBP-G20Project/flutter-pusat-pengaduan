// To parse this JSON data, do
//
//     final draftUser = draftUserFromJson(jsonString);

import 'dart:convert';
import 'package:intl/intl.dart';


class DraftUser {
    DraftUser({
      required  this.user,
      required  this.date,
      required  this.title,
      required  this.description,
    });

    int user;
    DateTime date;
    String title;
    String description;

    factory DraftUser.fromJson(Map<String, dynamic> json) => DraftUser(
        user: json["user"],
        date: DateTime.parse(json["date"]),
        title: json["title"],
        description: json["description"],
    );

    Map<String, dynamic> toJson() => {
        "user": user,
        "date": DateFormat("yyyy-MM-ddTHH:mm:ss").format(date),
        "title": title,
        "description": description,
    };
}
