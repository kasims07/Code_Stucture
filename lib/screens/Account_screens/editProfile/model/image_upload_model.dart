class UploadImageModel {
  UploadImageModel({
    this.status,
    this.message,
    this.data,});

  UploadImageModel.fromJson(dynamic json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  int? status;
  String? message;
  Data? data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    map['message'] = message;
    if (data != null) {
      map['data'] = data?.toJson();
    }
    return map;
  }

}

class Data {
  Data({
    this.sUrl,
    this.sPath,});

  Data.fromJson(dynamic json) {
    sUrl = json['sUrl'];
    sPath = json['sPath'];
  }
  String? sUrl;
  String? sPath;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['sUrl'] = sUrl;
    map['sPath'] = sPath;
    return map;
  }

}

