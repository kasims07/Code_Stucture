class BookingHistoryResponsModel {
  BookingHistoryResponsModel({
      this.status, 
      this.success, 
      this.data,});

  BookingHistoryResponsModel.fromJson(dynamic json) {
    status = json['status'];
    success = json['success'];
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(Data.fromJson(v));
      });
    }
  }
  int? status;
  bool? success;
  List<Data>? data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    map['success'] = success;
    if (data != null) {
      map['data'] = data?.map((v) => v.toJson()).toList();
    }
    return map;
  }

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
      this.v,});

  Data.fromJson(dynamic json) {
    id = json['_id'];
    createdBy = json['createdBy'];
    updatedBy = json['updatedBy'];
    cancelbooking = json['cancelbooking'];
    status = json['status'];
    category = json['category'];
    subService = json['sub_service'];
    prizes = json['prizes'];
    name = json['name'];
    mobileNumber = json['mobileNumber'];
    address = json['address'];
    bookingDate = json['BookingDate'];
    bookingtime = json['Bookingtime'];
    deleted = json['deleted'];
    sort = json['sort'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    v = json['__v'];
  }
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
  String? bookingDate;
  String? bookingtime;
  bool? deleted;
  int? sort;
  String? createdAt;
  String? updatedAt;
  int? v;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = id;
    map['createdBy'] = createdBy;
    map['updatedBy'] = updatedBy;
    map['cancelbooking'] = cancelbooking;
    map['status'] = status;
    map['category'] = category;
    map['sub_service'] = subService;
    map['prizes'] = prizes;
    map['name'] = name;
    map['mobileNumber'] = mobileNumber;
    map['address'] = address;
    map['BookingDate'] = bookingDate;
    map['Bookingtime'] = bookingtime;
    map['deleted'] = deleted;
    map['sort'] = sort;
    map['createdAt'] = createdAt;
    map['updatedAt'] = updatedAt;
    map['__v'] = v;
    return map;
  }

}