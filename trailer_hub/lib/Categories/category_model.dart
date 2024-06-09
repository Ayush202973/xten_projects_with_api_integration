// To parse this JSON data, do
//
//     final categoryApi = categoryApiFromJson(jsonString);

import 'dart:convert';

List<CategoryApi> categoryApiFromJson(String str) => List<CategoryApi>.from(
    json.decode(str).map((x) => CategoryApi.fromJson(x)));

String categoryApiToJson(List<CategoryApi> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CategoryApi {
  int id;
  String name;
  String image;

  CategoryApi({
    required this.id,
    required this.name,
    required this.image,
  });

  factory CategoryApi.fromJson(Map<String, dynamic> json) => CategoryApi(
        id: json["id"],
        name: json["name"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "image": image,
      };
}
