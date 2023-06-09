// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'read_products_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ReadProductsModel _$ReadProductsModelFromJson(Map<String, dynamic> json) =>
    ReadProductsModel(
      name: json['name'] as String?,
      is_active: json['is_active'] as bool?,
      aisle: json['aisle'] as String?,
      productPicturePath: json['productPicturePath'] as String?,
      price: (json['price'] as num?)?.toDouble(),
      date_added: json['date_added'] == null
          ? null
          : DateTime.parse(json['date_added'] as String),
      store_id: json['store_id'] as int?,
      id: json['id'] as int?,
      description: json['description'] as String?,
      is_featured: json['is_featured'] as bool?,
      bay: json['bay'] as String?,
      stock: json['stock'] as int?,
      date_last_updated: json['date_last_updated'] == null
          ? null
          : DateTime.parse(json['date_last_updated'] as String),
      options: (json['options'] as List<dynamic>?)
          ?.map((e) => Option.fromJson(e as Map<String, dynamic>))
          .toList(),
      currencyCode: json['currencyCode'] as String?,
    );

Map<String, dynamic> _$ReadProductsModelToJson(ReadProductsModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'is_active': instance.is_active,
      'aisle': instance.aisle,
      'productPicturePath': instance.productPicturePath,
      'price': instance.price,
      'date_added': instance.date_added?.toIso8601String(),
      'store_id': instance.store_id,
      'id': instance.id,
      'description': instance.description,
      'is_featured': instance.is_featured,
      'bay': instance.bay,
      'stock': instance.stock,
      'currencyCode': instance.currencyCode,
      'date_last_updated': instance.date_last_updated?.toIso8601String(),
      'options': instance.options,
    };

Option _$OptionFromJson(Map<String, dynamic> json) => Option(
      option: json['option'] as String?,
      id: json['id'] as int?,
      product_id: json['product_id'] as int?,
      option_price: (json['option_price'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$OptionToJson(Option instance) => <String, dynamic>{
      'option': instance.option,
      'id': instance.id,
      'product_id': instance.product_id,
      'option_price': instance.option_price,
    };
