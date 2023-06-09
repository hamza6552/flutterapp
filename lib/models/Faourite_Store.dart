// // To parse this JSON data, do
// //
// //     final favouriteStore = favouriteStoreFromJson(jsonString);

// import 'dart:convert';

// List<FavouriteStore?>? favouriteStoreFromJson(String str) => json.decode(str) == null ? [] : List<FavouriteStore?>.from(json.decode(str)!.map((x) => FavouriteStore.fromJson(x)));

// String favouriteStoreToJson(List<FavouriteStore?>? data) => json.encode(data == null ? [] : List<dynamic>.from(data!.map((x) => x!.toJson())));


// //  factory ReadStoresModel.fromJson(Map<String, dynamic> json) =>
// //       _$ReadStoresModelFromJson(json);

// //   Map<String, dynamic> toJson() => _$ReadStoresModelToJson(this);
// class FavouriteStore {
//     FavouriteStore({
//         this.userId,
//         this.dateAdded,
//         this.id,
//         this.storeId,
//     });

//     int? userId;
//     DateTime? dateAdded;
//     int? id;
//     int? storeId;

//     factory FavouriteStore.fromJson(Map<String, dynamic> json) => FavouriteStore(
//         userId: json["userId"],
//         dateAdded: DateTime.parse(json["date_added"]),
//         id: json["id"],
//         storeId: json["storeId"],
//     );

//     Map<String, dynamic> toJson() => {
//         "userId": userId,
//         "date_added": dateAdded?.toIso8601String(),
//         "id": id,
//         "storeId": storeId,
//     };
// }
