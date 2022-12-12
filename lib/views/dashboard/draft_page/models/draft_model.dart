// To parse this JSON data, do
//
//     final draftUser = draftUserFromJson(jsonString);

import 'dart:convert';

List<DraftUser> draftUserFromJson(String str) => List<DraftUser>.from(json.decode(str).map((x) => DraftUser.fromJson(x)));

String draftUserToJson(List<DraftUser> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class DraftUser {
    DraftUser({
      required  this.model,
      required  this.pk,
      required  this.fields,
    });

    String model;
    int pk;
    Fields fields;

    factory DraftUser.fromJson(Map<String, dynamic> json) => DraftUser(
        model: json["model"],
        pk: json["pk"],
        fields: Fields.fromJson(json["fields"]),
    );

    Map<String, dynamic> toJson() => {
        "model": model,
        "pk": pk,
        "fields": fields.toJson(),
    };
}

class Fields {
    Fields({
      required  this.user,
      required  this.date,
      required  this.title,
      required  this.description,
    });

    int user;
    DateTime date;
    String title;
    String description;

    factory Fields.fromJson(Map<String, dynamic> json) => Fields(
        user: json["user"],
        date: DateTime.parse(json["date"]),
        title: json["title"],
        description: json["description"],
    );

    Map<String, dynamic> toJson() => {
        "user": user,
        "date": date.toIso8601String(),
        "title": title,
        "description": description,
    };
}
