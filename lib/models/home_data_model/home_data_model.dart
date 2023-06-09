import 'package:json_annotation/json_annotation.dart';

part 'home_data_model.g.dart';

@JsonSerializable()
class HomeDataModel {
  List<FavoriteDataModel>? favoriteData;
  List<FeaturedPagesDataModel>? featuredPagesData;
  List<dynamic>? featuredProductsData;
  List<dynamic>? featuredStoresData;
  List<StoreDataModel>? storeData;

  HomeDataModel({
    this.favoriteData,
    this.featuredPagesData,
    this.featuredProductsData,
    this.featuredStoresData,
    this.storeData,
  });

  factory HomeDataModel.fromJson(Map<String, dynamic> json) =>
      _$HomeDataModelFromJson(json);

  Map<String, dynamic> toJson() => _$HomeDataModelToJson(this);
}

@JsonSerializable()
class FavoriteDataModel {
  int? id;
  int? storeId;
  String? storePicturePath;
  String? title;

  FavoriteDataModel({
    this.id,
    this.storeId,
    this.storePicturePath,
    this.title,
  });

  factory FavoriteDataModel.fromJson(Map<String, dynamic> json) =>
      _$FavoriteDataModelFromJson(json);

  Map<String, dynamic> toJson() => _$FavoriteDataModelToJson(this);
}

@JsonSerializable()
class FeaturedPagesDataModel {
  int? id;
  String? pagePicturePath;
  String? title;

  FeaturedPagesDataModel({
    this.id,
    this.title,
    this.pagePicturePath,
  });

  factory FeaturedPagesDataModel.fromJson(Map<String, dynamic> json) =>
      _$FeaturedPagesDataModelFromJson(json);

  Map<String, dynamic> toJson() => _$FeaturedPagesDataModelToJson(this);
}

@JsonSerializable()
class StoreDataModel {
  int? id;
  String? description;
  bool? is_featured;
  String? lon;
  String? storePicturePath;
  bool? is_active;
  String? title;
  String? lat;
  String? distance;
  String? address;
  String? rating;

  StoreDataModel({
    this.id,
    this.description,
    this.is_featured,
    this.lon,
    this.storePicturePath,
    this.is_active,
    this.title,
    this.lat,
    this.distance,
    this.address,
    this.rating,
  });

  factory StoreDataModel.fromJson(Map<String, dynamic> json) =>
      _$StoreDataModelFromJson(json);

  Map<String, dynamic> toJson() => _$StoreDataModelToJson(this);
}
