// To parse this JSON data, do
//
//     final lbServiceModel = lbServiceModelFromJson(jsonString);

import 'dart:convert';

LbServiceModel lbServiceModelFromJson(String str) => LbServiceModel.fromJson(json.decode(str));

String lbServiceModelToJson(LbServiceModel data) => json.encode(data.toJson());

class LbServiceModel {
  LbServiceModel({
    this.status,
    this.success,
    this.data,
  });

  int? status;
  bool? success;
  Data? data;

  factory LbServiceModel.fromJson(Map<String, dynamic> json) => LbServiceModel(
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
    this.createdBy,
    this.updatedBy,
    this.status,
    this.category,
    this.subService,
    this.prizes,
    this.name,
    this.mobileNumber,
    this.address,
    this.dateAndtime,
    this.deleted,
    this.id,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  String? createdBy;
  String? updatedBy;
  String? status;
  String? category;
  String? subService;
  String? prizes;
  String? name;
  int? mobileNumber;
  String? address;
  String? dateAndtime;
  bool? deleted;
  String? id;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    createdBy: json["createdBy"],
    updatedBy: json["updatedBy"],
    status: json["status"],
    category: json["category"],
    subService: json["subService"],
    prizes: json["prizes"],
    name: json["name"],
    mobileNumber: json["mobileNumber"],
    address: json["Address"],
    dateAndtime: json["DateAndtime"],
    deleted: json["deleted"],
    id: json["_id"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
    v: json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "createdBy": createdBy,
    "updatedBy": updatedBy,
    "status": status,
    "category": category,
    "subService": subService,
    "prizes": prizes,
    "name": name,
    "mobileNumber": mobileNumber,
    "Address": address,
    "DateAndtime": dateAndtime,
    "deleted": deleted,
    "_id": id,
    "createdAt": createdAt!.toIso8601String(),
    "updatedAt": updatedAt!.toIso8601String(),
    "__v": v,
  };
}
