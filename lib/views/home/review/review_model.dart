// To parse this JSON data, do
//
//     final review = reviewFromJson(jsonString);

import 'dart:convert';

List<Review> reviewFromJson(String str) =>
    List<Review>.from(json.decode(str).map((x) => Review.fromJson(x)));

String reviewToJson(List<Review> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Review {
  Review({
    required this.pk,
    required this.fields,
  });

  int pk;
  Fields fields;

  factory Review.fromJson(Map<String, dynamic> json) => Review(
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
    required this.user,
    this.rating,
    required this.comment,
  });

  int user;
  int? rating;
  String comment;

  factory Fields.fromJson(Map<String, dynamic> json) => Fields(
        user: json["user"],
        rating: json["rating"],
        comment: json["comment"],
      );

  Map<String, dynamic> toJson() => {
        "user": user,
        "rating": rating,
        "comment": comment,
      };
}

// enum Model { MAIN_PAGE_REVIEWS }

// final modelValues = EnumValues({"main_page.reviews": Model.MAIN_PAGE_REVIEWS});

// class EnumValues<T> {
//   Map<String, T> map;
//   Map<T, String> reverseMap;

//   EnumValues(this.map);

//   Map<T, String> get reverse {
//     if (reverseMap == null) {
//       reverseMap = map.map((k, v) => new MapEntry(v, k));
//     }
//     return reverseMap;
//   }
// }
