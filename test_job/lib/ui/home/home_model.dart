// To parse this JSON data, do
//
//     final homeData = homeDataFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

HomeData homeDataFromJson(String str) => HomeData.fromJson(json.decode(str));

String homeDataToJson(HomeData data) => json.encode(data.toJson());

class HomeData {
  HomeData({
    required this.result,
  });

  List<Result>? result;

  factory HomeData.fromJson(Map<String, dynamic> json) => HomeData(
    result: json["result"] == null ? null : List<Result>.from(json["result"].map((x) => Result.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "result": result == null ? null : List<dynamic>.from(result!.map((x) => x.toJson())),
  };
}

class Result {
  Result({
    required this.id,
    required this.fields,
  });

  String? id;
  Fields? fields;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
    id: json["_id"] == null ? null : json["_id"],
    fields: json["fields"] == null ? null : Fields.fromJson(json["fields"]),
  );

  Map<String, dynamic> toJson() => {
    "_id": id == null ? null : id,
    "fields": fields == null ? null : fields!.toJson(),
  };
}

class Fields {
  Fields({
    required this.storeId,
    required this.img,
    required this.assetName,
    required this.price,
    required this.category,
    required this.cdn,
    required this.unitPrice,
    required this.distanceM,
  });

  String? storeId;
  String? img;
  String? assetName;
  double? price;
  String? category;
  List<String>? cdn;
  String? unitPrice;
  int? distanceM;

  factory Fields.fromJson(Map<String, dynamic> json) => Fields(
    storeId: json["store_id"] == null ? null : json["store_id"],
    img: json["img"] == null ? null : json["img"],
    assetName: json["asset_name"] == null ? null : json["asset_name"],
    price: json["price"] == null ? null : json["price"].toDouble(),
    category: json["category"] == null ? null : json["category"],
    cdn: json["cdn"] == null ? null : List<String>.from(json["cdn"].map((x) => x)),
    unitPrice: json["unit_price"] == null ? null : json["unit_price"],
    distanceM: json["distance_m"] == null ? null : json["distance_m"],
  );

  Map<String, dynamic> toJson() => {
    "store_id": storeId == null ? null : storeId,
    "img": img == null ? null : img,
    "asset_name": assetName == null ? null : assetName,
    "price": price == null ? null : price,
    "category": category == null ? null : category,
    "cdn": cdn == null ? null : List<dynamic>.from(cdn!.map((x) => x)),
    "unit_price": unitPrice == null ? null : unitPrice,
    "distance_m": distanceM == null ? null : distanceM,
  };
}
