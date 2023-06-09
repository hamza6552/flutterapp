// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'read_stores_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ReadStoresModel _$ReadStoresModelFromJson(Map<String, dynamic> json) =>
    ReadStoresModel(
      id: json['id'] as int?,
      description: json['description'] as String?,
      is_featured: json['is_featured'] as bool?,
      lon: json['lon'] as String?,
      storePicturePath: json['storePicturePath'] as String?,
      is_active: json['is_active'] as bool?,
      title: json['title'] as String?,
      lat: json['lat'] as String?,
    );

Map<String, dynamic> _$ReadStoresModelToJson(ReadStoresModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'description': instance.description,
      'is_featured': instance.is_featured,
      'lon': instance.lon,
      'storePicturePath': instance.storePicturePath,
      'is_active': instance.is_active,
      'title': instance.title,
      'lat': instance.lat,
    };
