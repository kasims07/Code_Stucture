// To parse this JSON data, do
//
//     final cancelBookingModel = cancelBookingModelFromJson(jsonString);

import 'dart:convert';

CancelBookingModel cancelBookingModelFromJson(String str) => CancelBookingModel.fromJson(json.decode(str));

String cancelBookingModelToJson(CancelBookingModel data) => json.encode(data.toJson());

class CancelBookingModel {
  CancelBookingModel({
    this.status,
    this.success,
    this.data,
  });

  int? status;
  bool? success;
  Data? data;

  factory CancelBookingModel.fromJson(Map<String, dynamic> json) => CancelBookingModel(
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
    this.cancelbooking,
    this.status,
    this.category,
    this.subService,
    this.prizes,
    this.name,
    this.mobileNumber,
    this.address,
    this.bookingDate,
    this.bookingtime,
    this.deleted,
    this.sort,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.discription,
    this.reason,
  });

  String? id;
  String? createdBy;
  String? updatedBy;
  bool? cancelbooking;
  String? status;
  String? category;
  String? subService;
  String? prizes;
  String? name;
  int? mobileNumber;
  String? address;
  DateTime? bookingDate;
  String? bookingtime;
  bool? deleted;
  int? sort;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;
  String? discription;
  String? reason;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    id: json["_id"],
    createdBy: json["createdBy"],
    updatedBy: json["updatedBy"],
    cancelbooking: json["cancelbooking"],
    status: json["status"],
    category: json["category"],
    subService: json["sub_service"],
    prizes: json["prizes"],
    name: json["name"],
    mobileNumber: json["mobileNumber"],
    address: json["address"],
    bookingDate: DateTime.parse(json["BookingDate"]),
    bookingtime: json["Bookingtime"],
    deleted: json["deleted"],
    sort: json["sort"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
    v: json["__v"],
    discription: json["discription"],
    reason: json["reason"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "createdBy": createdBy,
    "updatedBy": updatedBy,
    "cancelbooking": cancelbooking,
    "status": status,
    "category": category,
    "sub_service": subService,
    "prizes": prizes,
    "name": name,
    "mobileNumber": mobileNumber,
    "address": address,
    "BookingDate": bookingDate!.toIso8601String(),
    "Bookingtime": bookingtime,
    "deleted": deleted,
    "sort": sort,
    "createdAt": createdAt!.toIso8601String(),
    "updatedAt": updatedAt!.toIso8601String(),
    "__v": v,
    "discription": discription,
    "reason": reason,
  };
}
