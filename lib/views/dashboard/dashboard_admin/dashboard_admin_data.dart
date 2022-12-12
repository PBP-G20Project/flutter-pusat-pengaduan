// To parse this JSON data, do
//
//     final adminReport = adminReportFromJson(jsonString);

import 'dart:convert';

List<AdminReport> adminReportFromJson(String str) => List<AdminReport>.from(
    json.decode(str).map((x) => AdminReport.fromJson(x)));

String adminReportToJson(List<AdminReport> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class AdminReport {
  AdminReport({
    required this.pk,
    required this.fields,
  });

  int pk;
  Fields fields;

  factory AdminReport.fromJson(Map<String, dynamic> json) => AdminReport(
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
  int adminSubmission;
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
