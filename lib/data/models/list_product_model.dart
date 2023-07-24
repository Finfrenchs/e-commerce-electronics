// ignore_for_file: public_member_api_docs, sort_constructors_first
// To parse this JSON data, do
//
//     final listProductModel = listProductModelFromJson(jsonString);

import 'dart:convert';

import 'package:flutter/foundation.dart';

class ListProductModel {
  List<Product>? data;
  Meta? meta;

  ListProductModel({
    this.data,
    this.meta,
  });

  factory ListProductModel.fromRawJson(String str) =>
      ListProductModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ListProductModel.fromJson(Map<String, dynamic> json) =>
      ListProductModel(
        data: json["data"] == null
            ? []
            : List<Product>.from(json["data"]!.map((x) => Product.fromJson(x))),
        meta: json["meta"] == null ? null : Meta.fromJson(json["meta"]),
      );

  Map<String, dynamic> toJson() => {
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
        "meta": meta?.toJson(),
      };

  @override
  bool operator ==(covariant ListProductModel other) {
    if (identical(this, other)) return true;

    return listEquals(other.data, data) && other.meta == meta;
  }

  @override
  int get hashCode => data.hashCode ^ meta.hashCode;
}

class Product {
  int? id;
  Attributes? attributes;

  Product({
    this.id,
    this.attributes,
  });

  factory Product.fromRawJson(String str) => Product.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["id"],
        attributes: json["attributes"] == null
            ? null
            : Attributes.fromJson(json["attributes"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "attributes": attributes?.toJson(),
      };

  @override
  bool operator ==(covariant Product other) {
    if (identical(this, other)) return true;

    return other.id == id && other.attributes == attributes;
  }

  @override
  int get hashCode => id.hashCode ^ attributes.hashCode;
}

class Attributes {
  String? name;
  DateTime? createdAt;
  DateTime? updatedAt;
  DateTime? publishedAt;
  String? description;
  String? quantity;
  String? price;
  bool? isAvailable;
  String? distributor;
  String? picture;

  Attributes({
    this.name,
    this.createdAt,
    this.updatedAt,
    this.publishedAt,
    this.description,
    this.quantity,
    this.price,
    this.isAvailable,
    this.distributor,
    this.picture,
  });

  factory Attributes.fromRawJson(String str) =>
      Attributes.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Attributes.fromJson(Map<String, dynamic> json) => Attributes(
        name: json["name"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
        publishedAt: json["publishedAt"] == null
            ? null
            : DateTime.parse(json["publishedAt"]),
        description: json["description"],
        quantity: json["quantity"],
        price: json["price"],
        isAvailable: json["isAvailable"],
        distributor: json["distributor"],
        picture: json["picture"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "publishedAt": publishedAt?.toIso8601String(),
        "description": description,
        "quantity": quantity,
        "price": price,
        "isAvailable": isAvailable,
        "distributor": distributor,
        "picture": picture,
      };

  @override
  bool operator ==(covariant Attributes other) {
    if (identical(this, other)) return true;

    return other.name == name &&
        other.createdAt == createdAt &&
        other.updatedAt == updatedAt &&
        other.publishedAt == publishedAt &&
        other.description == description &&
        other.quantity == quantity &&
        other.price == price &&
        other.isAvailable == isAvailable &&
        other.distributor == distributor &&
        other.picture == picture;
  }

  @override
  int get hashCode {
    return name.hashCode ^
        createdAt.hashCode ^
        updatedAt.hashCode ^
        publishedAt.hashCode ^
        description.hashCode ^
        quantity.hashCode ^
        price.hashCode ^
        isAvailable.hashCode ^
        distributor.hashCode ^
        picture.hashCode;
  }
}

class Meta {
  Pagination? pagination;

  Meta({
    this.pagination,
  });

  factory Meta.fromRawJson(String str) => Meta.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Meta.fromJson(Map<String, dynamic> json) => Meta(
        pagination: json["pagination"] == null
            ? null
            : Pagination.fromJson(json["pagination"]),
      );

  Map<String, dynamic> toJson() => {
        "pagination": pagination?.toJson(),
      };
}

class Pagination {
  int? page;
  int? pageSize;
  int? pageCount;
  int? total;

  Pagination({
    this.page,
    this.pageSize,
    this.pageCount,
    this.total,
  });

  factory Pagination.fromRawJson(String str) =>
      Pagination.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Pagination.fromJson(Map<String, dynamic> json) => Pagination(
        page: json["page"],
        pageSize: json["pageSize"],
        pageCount: json["pageCount"],
        total: json["total"],
      );

  Map<String, dynamic> toJson() => {
        "page": page,
        "pageSize": pageSize,
        "pageCount": pageCount,
        "total": total,
      };
}
