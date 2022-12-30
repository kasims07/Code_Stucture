// To parse this JSON data, do
//
//     final feedbackModel = feedbackModelFromJson(jsonString);

import 'dart:convert';

FeedbackModel feedbackModelFromJson(String str) => FeedbackModel.fromJson(json.decode(str));

String feedbackModelToJson(FeedbackModel data) => json.encode(data.toJson());

class FeedbackModel {
  FeedbackModel({
    this.status,
    this.success,
    this.data,
  });

  int? status;
  bool? success;
  Data? data;

  factory FeedbackModel.fromJson(Map<String, dynamic> json) => FeedbackModel(
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
    this.booking,
    this.discriptuion,
    this.rating,
    this.id,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  String? createdBy;
  String? updatedBy;
  String? booking;
  String? discriptuion;
  int? rating;
  String? id;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    createdBy: json["createdBy"],
    updatedBy: json["updatedBy"],
    booking: json["booking"],
    discriptuion: json["discriptuion"],
    rating: json["rating"],
    id: json["_id"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
    v: json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "createdBy": createdBy,
    "updatedBy": updatedBy,
    "booking": booking,
    "discriptuion": discriptuion,
    "rating": rating,
    "_id": id,
    "createdAt": createdAt!.toIso8601String(),
    "updatedAt": updatedAt!.toIso8601String(),
    "__v": v,
  };
}
