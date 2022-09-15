
// To parse this JSON data, do
//
//     final modelProducts = modelProductsFromJson(jsonString);

import 'dart:convert';

ModelProducts modelProductsFromJson(String str) => ModelProducts.fromJson(json.decode(str));

String modelProductsToJson(ModelProducts data) => json.encode(data.toJson());

class ModelProducts {
  ModelProducts({
    this.status,
    this.message,
    this.totalRecord,
    this.totalPage,
    this.data,
  });

  int? status;
  String? message;
  int? totalRecord;
  int? totalPage;
  List<Datum>? data;

  factory ModelProducts.fromJson(Map<String, dynamic> json) => ModelProducts(
    status: json["status"],
    message: json["message"],
    totalRecord: json["totalRecord"],
    totalPage: json["totalPage"],
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "totalRecord": totalRecord,
    "totalPage": totalPage,
    "data": List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class Datum {
  Datum({
    this.id,
    this.slug,
    this.title,
    this.description,
    this.price,
    this.featuredImage,
    this.status,
    this.createdAt,
    this.isSelected,
  });

  int? id;
  String? slug;
  String? title;
  String? description;
  int? price;
  String? featuredImage;
  String? status;
  String? createdAt;
  bool? isSelected=false;
  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    slug: json["slug"],
    title: json["title"],
    description: json["description"],
    price: json["price"],
    featuredImage: json["featured_image"],
    status: json["status"],
    createdAt:json["created_at"],
    isSelected:false,
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "slug": slug,
    "title": title,
    "description": description,
    "price": price,
    "featured_image": featuredImage,
    "status": status,
    "created_at": createdAt,
    "isSelected": isSelected,
  };
}
