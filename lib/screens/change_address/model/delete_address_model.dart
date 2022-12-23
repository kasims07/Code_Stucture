// To parse this JSON data, do
//
//     final deleteAddressModel = deleteAddressModelFromJson(jsonString);

import 'dart:convert';

DeleteAddressModel deleteAddressModelFromJson(String str) => DeleteAddressModel.fromJson(json.decode(str));

String deleteAddressModelToJson(DeleteAddressModel data) => json.encode(data.toJson());

class DeleteAddressModel {
  DeleteAddressModel({
    this.status,
    this.success,
    this.data,
  });

  int? status;
  bool? success;
  Data? data;

  factory DeleteAddressModel.fromJson(Map<String, dynamic> json) => DeleteAddressModel(
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
    this.address,
    this.houseno,
    this.state,
    this.city,
    this.zipcode,
    this.addresstype,
    this.user,
    this.deleted,
    this.v,
  });

  String? id;
  String? createdBy;
  String? updatedBy;
  String? address;
  int? houseno;
  String? state;
  String? city;
  int? zipcode;
  String? addresstype;
  String? user;
  bool? deleted;
  int? v;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    id: json["_id"],
    createdBy: json["createdBy"],
    updatedBy: json["updatedBy"],
    address: json["address"],
    houseno: json["houseno"],
    state: json["state"],
    city: json["city"],
    zipcode: json["Zipcode"],
    addresstype: json["addresstype"],
    user: json["user"],
    deleted: json["deleted"],
    v: json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "createdBy": createdBy,
    "updatedBy": updatedBy,
    "address": address,
    "houseno": houseno,
    "state": state,
    "city": city,
    "Zipcode": zipcode,
    "addresstype": addresstype,
    "user": user,
    "deleted": deleted,
    "__v": v,
  };
}
