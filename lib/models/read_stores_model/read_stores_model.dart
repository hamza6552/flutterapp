import 'package:json_annotation/json_annotation.dart';

part 'read_stores_model.g.dart';

@JsonSerializable()
class ReadStoresModel {
  final int? id;
  final String? description;
  final bool? is_featured;
  final String? lon;
  final String? storePicturePath;
  final bool? is_active;
  final String? title;
  final String? lat;

  ReadStoresModel(
      {this.id,
      this.description,
      this.is_featured,
      this.lon,
      this.storePicturePath,
      this.is_active,
      this.title,
      this.lat});

  factory ReadStoresModel.fromJson(Map<String, dynamic> json) =>
      _$ReadStoresModelFromJson(json);

  Map<String, dynamic> toJson() => _$ReadStoresModelToJson(this);
}
