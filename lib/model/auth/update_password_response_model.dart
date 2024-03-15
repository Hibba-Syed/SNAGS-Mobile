class UpdatePasswordResponseModel {
  UpdatePasswordResponseModel({
      this.status, 
      this.record, 
      this.code, 
      this.meta, 
      this.requestStatus, 
      this.message,});

  UpdatePasswordResponseModel.fromJson(dynamic json) {
    status = json['status'];
    record = json['record'];
    code = json['code'];
    meta = json['meta'];
    requestStatus = json['request_status'];
    message = json['message'];
  }
  String? status;
  dynamic record;
  int? code;
  dynamic meta;
  bool? requestStatus;
  String? message;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    map['record'] = record;
    map['code'] = code;
    map['meta'] = meta;
    map['request_status'] = requestStatus;
    map['message'] = message;
    return map;
  }

}