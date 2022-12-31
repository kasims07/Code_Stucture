// To parse this JSON data, do
//
//     final allCategoriesModel = allCategoriesModelFromJson(jsonString);

import 'dart:convert';

AllCategoriesModel allCategoriesModelFromJson(String str) => AllCategoriesModel.fromJson(json.decode(str));

String allCategoriesModelToJson(AllCategoriesModel data) => json.encode(data.toJson());

class AllCategoriesModel {
  AllCategoriesModel({
    this.status,
    this.success,
    this.data,
    this.user,
  });

  int? status;
  bool? success;
  List<Datum>? data;
  User? user;

  factory AllCategoriesModel.fromJson(Map<String, dynamic> json) => AllCategoriesModel(
    status: json["status"],
    success: json["success"],
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    user: User.fromJson(json["user"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "success": success,
    "data": List<dynamic>.from(data!.map((x) => x.toJson())),
    "user": user!.toJson(),
  };
}

class Datum {
  Datum({
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

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["_id"],
    createdBy: json["createdBy"],
    updatedBy: json["updatedBy"],
    category: json["category"],
    description: json["description"],
    deleted: json["deleted"],
    image: json["image"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
    v: json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "createdBy": createdBy,
    "updatedBy": updatedBy,
    "category": category,
    "description": description,
    "deleted": deleted,
    "image": image,
    "createdAt": createdAt!.toIso8601String(),
    "updatedAt": updatedAt!.toIso8601String(),
    "__v": v,
  };
}

class User {
  User({
    this.id,
    this.phoneNumber,
    this.deleted,
    this.active,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.email,
    this.name,
    this.userimage,
  });

  String? id;
  String? phoneNumber;
  bool? deleted;
  bool? active;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;
  String? email;
  String? name;
  String? userimage;

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json["_id"],
    phoneNumber: json["phoneNumber"],
    deleted: json["deleted"],
    active: json["active"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
    v: json["__v"],
    email: json["email"] == null ? '' : json["email"],
    name: json["name"] == null ? '' : json["name"],
    userimage: json["userimage"] == null ? '' : json["userimage"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "phoneNumber": phoneNumber,
    "deleted": deleted,
    "active": active,
    "createdAt": createdAt!.toIso8601String(),
    "updatedAt": updatedAt!.toIso8601String(),
    "__v": v,
    "email": email,
    "name": name,
    "userimage"  : userimage
  };
}
