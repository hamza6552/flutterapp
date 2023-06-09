// To parse this JSON data, do
//
//     final featureStore = featureStoreFromJson(jsonString);

import 'dart:convert';

FeatureStore? featureStoreFromJson(String str) => FeatureStore.fromJson(json.decode(str));

String featureStoreToJson(FeatureStore? data) => json.encode(data!.toJson());

class FeatureStore {
    FeatureStore({
        this.featuredStores,
    });

    List<FeaturedStore?>? featuredStores;

    factory FeatureStore.fromJson(Map<String, dynamic> json) => FeatureStore(
        featuredStores: json["featured_stores"] == null ? [] : List<FeaturedStore?>.from(json["featured_stores"]!.map((x) => FeaturedStore.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "featured_stores": featuredStores == null ? [] : List<dynamic>.from(featuredStores!.map((x) => x!.toJson())),
    };
}

class FeaturedStore {
    FeaturedStore({
        this.title,
        this.isActive,
        this.storePicturePath,
        this.description,
        this.id,
        this.isFeatured,
    });

    String? title;
    bool? isActive;
    String? storePicturePath;
    String? description;
    int? id;
    bool? isFeatured;

    factory FeaturedStore.fromJson(Map<String, dynamic> json) => FeaturedStore(
        title: json["title"],
        isActive: json["is_active"],
        storePicturePath: json["storePicturePath"],
        description: json["description"],
        id: json["id"],
        isFeatured: json["is_featured"],
    );

    Map<String, dynamic> toJson() => {
        "title": title,
        "is_active": isActive,
        "storePicturePath": storePicturePath,
        "description": description,
        "id": id,
        "is_featured": isFeatured,
    };
}
