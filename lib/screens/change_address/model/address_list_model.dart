// To parse this JSON data, do
//
//     final addressListModel = addressListModelFromJson(jsonString);

import 'dart:convert';

AddressListModel addressListModelFromJson(String str) => AddressListModel.fromJson(json.decode(str));

String addressListModelToJson(AddressListModel data) => json.encode(data.toJson());

class AddressListModel {
  AddressListModel({
    this.status,
    this.success,
    this.data,
  });

  int? status;
  bool? success;
  List<Datum>? data;

  factory AddressListModel.fromJson(Map<String, dynamic> json) => AddressListModel(
    status: json["status"],
    success: json["success"],
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "success": success,
    "data": List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class Datum {
  Datum({
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

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
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
