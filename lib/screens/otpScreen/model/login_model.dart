// To parse this JSON data, do
//
//     final loginModel = loginModelFromJson(jsonString);

import 'dart:convert';

LoginModel loginModelFromJson(String str) => LoginModel.fromJson(json.decode(str));

String loginModelToJson(LoginModel data) => json.encode(data.toJson());

class LoginModel {
  LoginModel({
    this.status,
    this.success,
    this.isExist,
    this.active,
    this.deleted,
    this.data,
    this.token,
  });

  int? status;
  bool? success;
  bool? isExist;
  bool? active;
  bool? deleted;
  Data? data;
  String? token;

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
    status: json["status"],
    success: json["success"],
    isExist: json["isExist"],
    active: json["active"],
    deleted: json["deleted"],
    data: Data.fromJson(json["data"]),
    token: json["token"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "success": success,
    "isExist": isExist,
    "active": active,
    "deleted": deleted,
    "data": data!.toJson(),
    "token": token,
  };
}

class Data {
  Data({
    this.id,
    this.phoneNumber,
    this.deleted,
    this.active,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.email,
    this.name,
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

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    id: json["_id"],
    phoneNumber: json["phoneNumber"],
    deleted: json["deleted"],
    active: json["active"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
    v: json["__v"],
    email: json["email"],
    name: json["name"],
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
  };
}
