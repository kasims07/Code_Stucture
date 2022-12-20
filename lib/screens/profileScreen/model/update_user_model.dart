// To parse this JSON data, do
//
//     final updateUserModel = updateUserModelFromJson(jsonString);

import 'dart:convert';

UpdateUserModel updateUserModelFromJson(String str) => UpdateUserModel.fromJson(json.decode(str));

String updateUserModelToJson(UpdateUserModel data) => json.encode(data.toJson());

class UpdateUserModel {
  UpdateUserModel({
    this.status,
    this.success,
    this.data,
  });

  int? status;
  bool? success;
  Data? data;

  factory UpdateUserModel.fromJson(Map<String, dynamic> json) => UpdateUserModel(
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
    this.role,
    this.phoneNumber,
    this.deleted,
    this.active,
    this.uid,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.email,
    this.name,
  });

  String? id;
  String? role;
  String? phoneNumber;
  bool? deleted;
  bool? active;
  String? uid;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;
  String? email;
  String? name;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    id: json["_id"],
    role: json["role"],
    phoneNumber: json["phoneNumber"],
    deleted: json["deleted"],
    active: json["active"],
    uid: json["uid"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
    v: json["__v"],
    email: json["email"],
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "role": role,
    "phoneNumber": phoneNumber,
    "deleted": deleted,
    "active": active,
    "uid": uid,
    "createdAt": createdAt!.toIso8601String(),
    "updatedAt": updatedAt!.toIso8601String(),
    "__v": v,
    "email": email,
    "name": name,
  };
}
