// To parse this JSON data, do
//
//     final addAddressModel = addAddressModelFromJson(jsonString);

import 'dart:convert';

AddAddressModel addAddressModelFromJson(String str) => AddAddressModel.fromJson(json.decode(str));

String addAddressModelToJson(AddAddressModel data) => json.encode(data.toJson());

class AddAddressModel {
  AddAddressModel({
    this.status,
    this.success,
    this.data,
  });

  int? status;
  bool? success;
  Data? data;

  factory AddAddressModel.fromJson(Map<String, dynamic> json) => AddAddressModel(
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
    this.address,
    this.houseno,
    this.state,
    this.city,
    this.zipcode,
    this.addresstype,
    this.user,
    this.deleted,
    this.id,
    this.v,
  });

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
  String? id;
  int? v;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
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
    id: json["_id"],
    v: json["__v"],
  );

  Map<String, dynamic> toJson() => {
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
    "_id": id,
    "__v": v,
  };
}
