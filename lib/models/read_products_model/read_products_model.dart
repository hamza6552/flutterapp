import 'package:json_annotation/json_annotation.dart';

part 'read_products_model.g.dart';

@JsonSerializable()
class ReadProductsModel {
  ReadProductsModel({
    this.name,
    this.is_active,
    this.aisle,
    this.productPicturePath,
    this.price,
    this.date_added,
    this.store_id,
    this.id,
    this.description,
    this.is_featured,
    this.bay,
    this.stock,
    this.date_last_updated,
    this.options,
    this.currencyCode,
  });

  final String? name;
  final bool? is_active;
  final String? aisle;
  final String? productPicturePath;
  final double? price;
  final DateTime? date_added;
  final int? store_id;
  final int? id;
  final String? description;
  final bool? is_featured;
  final String? bay;
  final int? stock;
  final String? currencyCode;
  final DateTime? date_last_updated;
  final List<Option>? options;

  factory ReadProductsModel.fromJson(Map<String, dynamic> json) =>
      _$ReadProductsModelFromJson(json);

  Map<String, dynamic> toJson() => _$ReadProductsModelToJson(this);
}

@JsonSerializable()
class Option {
  Option({
    this.option,
    this.id,
    this.product_id,
    this.option_price,
  });

  final String? option;
  final int? id;
  final int? product_id;
  final double? option_price;

  factory Option.fromJson(Map<String, dynamic> json) => _$OptionFromJson(json);

  Map<String, dynamic> toJson() => _$OptionToJson(this);
}
