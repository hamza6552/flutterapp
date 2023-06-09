// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_data_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HomeDataModel _$HomeDataModelFromJson(Map<String, dynamic> json) =>
    HomeDataModel(
      favoriteData: (json['favoriteData'] as List<dynamic>?)
          ?.map((e) => FavoriteDataModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      featuredPagesData: (json['featuredPagesData'] as List<dynamic>?)
          ?.map(
              (e) => FeaturedPagesDataModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      featuredProductsData: json['featuredProductsData'] as List<dynamic>?,
      featuredStoresData: json['featuredStoresData'] as List<dynamic>?,
      storeData: (json['storeData'] as List<dynamic>?)
          ?.map((e) => StoreDataModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$HomeDataModelToJson(HomeDataModel instance) =>
    <String, dynamic>{
      'favoriteData': instance.favoriteData,
      'featuredPagesData': instance.featuredPagesData,
      'featuredProductsData': instance.featuredProductsData,
      'featuredStoresData': instance.featuredStoresData,
      'storeData': instance.storeData,
    };

FavoriteDataModel _$FavoriteDataModelFromJson(Map<String, dynamic> json) =>
    FavoriteDataModel(
      id: json['id'] as int?,
      storeId: json['storeId'] as int?,
      storePicturePath: json['storePicturePath'] as String?,
      title: json['title'] as String?,
    );

Map<String, dynamic> _$FavoriteDataModelToJson(FavoriteDataModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'storeId': instance.storeId,
      'storePicturePath': instance.storePicturePath,
      'title': instance.title,
    };

FeaturedPagesDataModel _$FeaturedPagesDataModelFromJson(
        Map<String, dynamic> json) =>
    FeaturedPagesDataModel(
      id: json['id'] as int?,
      title: json['title'] as String?,
      pagePicturePath: json['storePicturePath'] as String?,
    );

Map<String, dynamic> _$FeaturedPagesDataModelToJson(
        FeaturedPagesDataModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'storePicturePath': instance.pagePicturePath,
      'title': instance.title,
    };

StoreDataModel _$StoreDataModelFromJson(Map<String, dynamic> json) =>
    StoreDataModel(
      id: json['id'] as int?,
      description: json['description'] as String?,
      is_featured: json['is_featured'] as bool?,
      lon: json['lon'] as String?,
      storePicturePath: json['storePicturePath'] as String?,
      is_active: json['is_active'] as bool?,
      title: json['title'] as String?,
      lat: json['lat'] as String?,
      distance: json['distance'] as String?,
      address: json['address'] as String?,
      rating: json['rating'] as String?,
    );

Map<String, dynamic> _$StoreDataModelToJson(StoreDataModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'description': instance.description,
      'is_featured': instance.is_featured,
      'lon': instance.lon,
      'storePicturePath': instance.storePicturePath,
      'is_active': instance.is_active,
      'title': instance.title,
      'lat': instance.lat,
      'distance': instance.distance,
      'address': instance.address,
      'rating': instance.rating,
    };
