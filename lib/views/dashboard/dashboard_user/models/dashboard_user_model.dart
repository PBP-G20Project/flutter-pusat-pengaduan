// To parse this JSON data, do
//
//     final laporanUser = laporanUserFromJson(jsonString);

import 'dart:convert';

List<LaporanUser> laporanUserFromJson(String str) => List<LaporanUser>.from(json.decode(str).map((x) => LaporanUser.fromJson(x)));

String laporanUserToJson(List<LaporanUser> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class LaporanUser {
    LaporanUser({
        required this.model,
        required this.pk,
        required this.fields,
    });

    String model;
    int pk;
    Fields fields;

    factory LaporanUser.fromJson(Map<String, dynamic> json) => LaporanUser(
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
      required this.userSubmission,
      required this.adminSubmission,
      required this.title,
      required this.content,
      required this.institution,
      required this.institutionLevel,
      required this.involvedParty,
      required this.date,
      required this.location,
      required this.status,
    });

    int userSubmission;
    dynamic adminSubmission;
    String title;
    String content;
    String institution;
    String institutionLevel;
    String involvedParty;
    DateTime date;
    String location;
    String status;

    factory Fields.fromJson(Map<String, dynamic> json) => Fields(
        userSubmission: json["user_submission"],
        adminSubmission: json["admin_submission"],
        title: json["title"],
        content: json["content"],
        institution: json["institution"],
        institutionLevel: json["institution_level"],
        involvedParty: json["involved_party"],
        date: DateTime.parse(json["date"]),
        location: json["location"],
        status: json["status"],
    );

    Map<String, dynamic> toJson() => {
        "user_submission": userSubmission,
        "admin_submission": adminSubmission,
        "title": title,
        "content": content,
        "institution": institution,
        "institution_level": institutionLevel,
        "involved_party": involvedParty,
        "date": date.toIso8601String(),
        "location": location,
        "status": status,
    };
}
