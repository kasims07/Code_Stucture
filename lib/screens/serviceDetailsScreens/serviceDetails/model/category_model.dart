// To parse this JSON data, do
//
//     final categoryModel = categoryModelFromJson(jsonString);

import 'dart:convert';

CategoryModel categoryModelFromJson(String str) => CategoryModel.fromJson(json.decode(str));

String categoryModelToJson(CategoryModel data) => json.encode(data.toJson());

class CategoryModel {
  CategoryModel({
    this.status,
    this.success,
    this.data,
  });

  int? status;
  bool? success;
  Data? data;

  factory CategoryModel.fromJson(Map<String, dynamic> json) => CategoryModel(
    status: json["status"],
    success: json["success"],
    data: Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "success": success,
    "data": data!.toJson(),
  };
}

class Data {
  Data({
    this.id,
    this.createdBy,
    this.updatedBy,
    this.category,
    this.description,
    this.deleted,
    this.image,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.subServices,
    this.name,
    this.images,
  });

  String? id;
  String? createdBy;
  String? updatedBy;
  String? category;
  String? description;
  bool? deleted;
  String? image;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;
  List<Data>? subServices;
  String? name;
  List<String>? images;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    id: json["_id"],
    createdBy: json["createdBy"],
    updatedBy: json["updatedBy"],
    category: json["category"],
    description: json["description"],
    deleted: json["deleted"],
    image: json["image"] == null ? null : json["image"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
    v: json["__v"],
    subServices: json["subServices"] == null ? null : List<Data>.from(json["subServices"].map((x) => Data.fromJson(x))),
    name: json["name"] == null ? null : json["name"],
    images: json["images"] == null ? null : List<String>.from(json["images"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "createdBy": createdBy,
    "updatedBy": updatedBy,
    "category": category,
    "description": description,
    "deleted": deleted,
    "image": image == null ? null : image,
    "createdAt": createdAt!.toIso8601String(),
    "updatedAt": updatedAt!.toIso8601String(),
    "__v": v,
    "subServices": subServices == null ? null : List<dynamic>.from(subServices!.map((x) => x.toJson())),
    "name": name == null ? null : name,
    "images": images == null ? null : List<dynamic>.from(images!.map((x) => x)),
  };
}
