// To parse this JSON data, do
//
//     final report = reportFromJson(jsonString);

import 'dart:convert';

import 'package:intl/intl.dart';

Report reportFromJson(String str) => Report.fromJson(json.decode(str));

String reportToJson(Report data) => json.encode(data.toJson());

class Report {
  Report({
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

  String userSubmission;
  String adminSubmission;
  String title;
  String content;
  String institution;
  String institutionLevel;
  String involvedParty;
  DateTime date;
  String location;
  String status;

  factory Report.fromJson(Map<String, dynamic> json) => Report(
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
        "date": DateFormat("yyyy-MM-ddTHH:mm:ss").format(date),
        "location": location,
        "status": status,
      };
}
