class SnagsStatisticsByMonthResponseModel {
  SnagsStatisticsByMonthResponseModel({
      this.status, 
      this.record, 
      this.code, 
      this.meta, 
      this.requestStatus, 
      this.message,});

  SnagsStatisticsByMonthResponseModel.fromJson(dynamic json) {
    status = json['status'];
    if (json['record'] != null) {
      record = [];
      json['record'].forEach((v) {
        record?.add(SnagsStatisticsByMonthRecord.fromJson(v));
      });
    }
    code = json['code'];
    meta = json['meta'];
    requestStatus = json['request_status'];
    message = json['message'];
  }
  String? status;
  List<SnagsStatisticsByMonthRecord>? record;
  int? code;
  dynamic meta;
  bool? requestStatus;
  String? message;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    if (record != null) {
      map['record'] = record?.map((v) => v.toJson()).toList();
    }
    map['code'] = code;
    map['meta'] = meta;
    map['request_status'] = requestStatus;
    map['message'] = message;
    return map;
  }

}

class SnagsStatisticsByMonthRecord {
  SnagsStatisticsByMonthRecord({
      this.name, 
      this.data,});

  SnagsStatisticsByMonthRecord.fromJson(dynamic json) {
    name = json['name'];
    data = json['data'] != null ? json['data'].cast<int>() : [];
  }
  String? name;
  List<int>? data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = name;
    map['data'] = data;
    return map;
  }

}