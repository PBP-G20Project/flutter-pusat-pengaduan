// To parse this JSON data, do
//
//     final user = userFromJson(jsonString);

import 'dart:convert';

List<User> userFromJson(String str) =>
    List<User>.from(json.decode(str).map((x) => User.fromJson(x)));

String userToJson(List<User> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class User {
  User({
    required this.model,
    required this.pk,
    required this.fields,
  });

  String model;
  int pk;
  Fields fields;

  factory User.fromJson(Map<String, dynamic> json) => User(
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
    required this.password,
    required this.lastLogin,
    required this.isSuperuser,
    required this.email,
    required this.nama,
    required this.nik,
    required this.active,
    required this.staff,
    required this.admin,
    required this.groups,
    required this.userPermissions,
  });

  String password;
  DateTime lastLogin;
  bool isSuperuser;
  String email;
  String nama;
  String nik;
  bool active;
  bool staff;
  bool admin;
  List<dynamic> groups;
  List<dynamic> userPermissions;

  factory Fields.fromJson(Map<String, dynamic> json) => Fields(
        password: json["password"],
        lastLogin: DateTime.parse(json["last_login"]),
        isSuperuser: json["is_superuser"],
        email: json["email"],
        nama: json["nama"],
        nik: json["nik"],
        active: json["active"],
        staff: json["staff"],
        admin: json["admin"],
        groups: List<dynamic>.from(json["groups"].map((x) => x)),
        userPermissions:
            List<dynamic>.from(json["user_permissions"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "password": password,
        "last_login": lastLogin.toIso8601String(),
        "is_superuser": isSuperuser,
        "email": email,
        "nama": nama,
        "nik": nik,
        "active": active,
        "staff": staff,
        "admin": admin,
        "groups": List<dynamic>.from(groups.map((x) => x)),
        "user_permissions": List<dynamic>.from(userPermissions.map((x) => x)),
      };
}
