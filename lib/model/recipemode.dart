// To parse this JSON data, do
//
//     final recipelistModel = recipelistModelFromJson(jsonString);

import 'dart:convert';

RecipelistModel recipelistModelFromJson(String str) =>
    RecipelistModel.fromJson(json.decode(str));

String recipelistModelToJson(RecipelistModel data) =>
    json.encode(data.toJson());

class RecipelistModel {
  RecipelistModel({
    required this.status,
    required this.data,
    required this.message,
  });

  bool? status;
  List<Datum>? data;
  String? message;

  factory RecipelistModel.fromJson(Map<String, dynamic> json) =>
      RecipelistModel(
        status: json["status"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
        "message": message,
      };
}

class Datum {
  Datum({
    this.image,
    this.id,
    this.title,
  });

  String? image;
  int? id;
  String? title;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        image: json["image"],
        id: json["id"],
        title: json["title"],
      );

  Map<String, dynamic> toJson() => {
        "image": image,
        "id": id,
        "title": title,
      };
}
