// To parse this JSON data, do
//
//     final subserviceModel = subserviceModelFromJson(jsonString);

import 'dart:convert';

SubserviceModel subserviceModelFromJson(String str) => SubserviceModel.fromJson(json.decode(str));

String subserviceModelToJson(SubserviceModel data) => json.encode(data.toJson());

class SubserviceModel {
  SubserviceModel({
    this.status,
    this.success,
    this.data,
  });

  int? status;
  bool? success;
  Data? data;

  factory SubserviceModel.fromJson(Map<String, dynamic> json) => SubserviceModel(
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
    this.category,
    this.createdBy,
    this.updatedBy,
    this.name,
    this.description,
    this.deleted,
    this.images,
    this.sort,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.includes,
    this.prize,
  });

  String? id;
  String? category;
  String? createdBy;
  String? updatedBy;
  String? name;
  String? description;
  bool? deleted;
  List<String>? images;
  int? sort;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;
  List<Include>? includes;
  List<Include>? prize;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    id: json["_id"],
    category: json["category"],
    createdBy: json["createdBy"],
    updatedBy: json["updatedBy"],
    name: json["name"],
    description: json["description"],
    deleted: json["deleted"],
    images: List<String>.from(json["images"].map((x) => x)),
    sort: json["sort"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
    v: json["__v"],
    includes: List<Include>.from(json["includes"].map((x) => Include.fromJson(x))),
    prize: List<Include>.from(json["prize"].map((x) => Include.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "category": category,
    "createdBy": createdBy,
    "updatedBy": updatedBy,
    "name": name,
    "description": description,
    "deleted": deleted,
    "images": List<dynamic>.from(images!.map((x) => x)),
    "sort": sort,
    "createdAt": createdAt!.toIso8601String(),
    "updatedAt": updatedAt!.toIso8601String(),
    "__v": v,
    "includes": List<dynamic>.from(includes!.map((x) => x.toJson())),
    "prize": List<dynamic>.from(prize!.map((x) => x.toJson())),
  };
}

class Include {
  Include({
    this.id,
    this.createdBy,
    this.updatedBy,
    this.category,
    this.include,
    this.subService,
    this.deleted,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.title,
    this.prize,
    this.isSelected
  });

  String? id;
  String? createdBy;
  String? updatedBy;
  String? category;
  String? include;
  String? subService;
  bool? deleted;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;
  String? title;
  int? prize;
  bool? isSelected;

  factory Include.fromJson(Map<String, dynamic> json) => Include(
    id: json["_id"],
    createdBy: json["createdBy"],
    updatedBy: json["updatedBy"],
    category: json["category"],
    include: json["include"] == null ? null : json["include"],
    subService: json["sub_service"],
    deleted: json["deleted"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
    v: json["__v"],
    title: json["title"] == null ? null : json["title"],
    prize: json["prize"] == null ? null : json["prize"],
    isSelected: false
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "createdBy": createdBy,
    "updatedBy": updatedBy,
    "category": category,
    "include": include == null ? null : include,
    "sub_service": subService,
    "deleted": deleted,
    "createdAt": createdAt!.toIso8601String(),
    "updatedAt": updatedAt!.toIso8601String(),
    "__v": v,
    "title": title == null ? null : title,
    "prize": prize == null ? null : prize,
    "isSelected": false
  };
}
