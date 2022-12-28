// To parse this JSON data, do
//
//     final bookingHistoryModel = bookingHistoryModelFromJson(jsonString);

import 'dart:convert';

BookingHistoryModel bookingHistoryModelFromJson(String str) => BookingHistoryModel.fromJson(json.decode(str));

String bookingHistoryModelToJson(BookingHistoryModel data) => json.encode(data.toJson());

class BookingHistoryModel {
  BookingHistoryModel({
    this.status,
    this.success,
    this.data,
  });

  int? status;
  bool? success;
  List<Datum>? data;

  factory BookingHistoryModel.fromJson(Map<String, dynamic> json) => BookingHistoryModel(
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
  List<Category>? category;
  List<SubService>? subService;
  List<Prize>? prizes;
  String? name;
  int? mobileNumber;
  List<Address>? address;
  DateTime? bookingDate;
  String? bookingtime;
  bool? deleted;
  int? sort;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;
  String? discription;
  String? reason;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["_id"],
    createdBy: json["createdBy"],
    updatedBy: json["updatedBy"],
    cancelbooking: json["cancelbooking"],
    status: json["status"],
    category: List<Category>.from(json["category"].map((x) => Category.fromJson(x))),
    subService: List<SubService>.from(json["sub_service"].map((x) => SubService.fromJson(x))),
    prizes: List<Prize>.from(json["prizes"].map((x) => Prize.fromJson(x))),
    name: json["name"],
    mobileNumber: json["mobileNumber"],
    address: List<Address>.from(json["address"].map((x) => Address.fromJson(x))),
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
    "category": List<dynamic>.from(category!.map((x) => x.toJson())),
    "sub_service": List<dynamic>.from(subService!.map((x) => x.toJson())),
    "prizes": List<dynamic>.from(prizes!.map((x) => x.toJson())),
    "name": name,
    "mobileNumber": mobileNumber,
    "address": List<dynamic>.from(address!.map((x) => x.toJson())),
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

class Address {
  Address({
    this.id,
    this.address,
    this.houseno,
    this.state,
    this.city,
    this.zipcode,
    this.addresstype,
    this.deleted,
    this.v,
  });

  String? id;
  String? address;
  int? houseno;
  String? state;
  String? city;
  int? zipcode;
  String? addresstype;
  bool? deleted;
  int? v;

  factory Address.fromJson(Map<String, dynamic> json) => Address(
    id: json["_id"],
    address: json["address"],
    houseno: json["houseno"],
    state: json["state"],
    city: json["city"],
    zipcode: json["Zipcode"],
    addresstype: json["addresstype"],
    deleted: json["deleted"],
    v: json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "address": address,
    "houseno": houseno,
    "state": state,
    "city": city,
    "Zipcode": zipcode,
    "addresstype": addresstype,
    "deleted": deleted,
    "__v": v,
  };
}

class Category {
  Category({
    this.id,
    this.category,
    this.description,
  });

  String? id;
  String? category;
  String? description;

  factory Category.fromJson(Map<String, dynamic> json) => Category(
    id: json["_id"],
    category: json["category"],
    description: json["description"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "category": category,
    "description": description,
  };
}

class Prize {
  Prize({
    this.id,
    this.title,
    this.prize,
  });

  String? id;
  String? title;
  int? prize;

  factory Prize.fromJson(Map<String, dynamic> json) => Prize(
    id: json["_id"],
    title: json["title"],
    prize: json["prize"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "title": title,
    "prize": prize,
  };
}

class SubService {
  SubService({
    this.id,
    this.name,
    this.description,
  });

  String? id;
  String? name;
  String? description;

  factory SubService.fromJson(Map<String, dynamic> json) => SubService(
    id: json["_id"],
    name: json["name"],
    description: json["description"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "name": name,
    "description": description,
  };
}
