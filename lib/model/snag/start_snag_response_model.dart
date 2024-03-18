import 'package:iskaan_inspections_mobile/model/snag/snag_model.dart';

class StartSnagResponseModel {
  StartSnagResponseModel({
      this.status, 
      this.snag,
      this.code, 
      this.meta, 
      this.requestStatus, 
      this.message,});

  StartSnagResponseModel.fromJson(dynamic json) {
    status = json['status'];
    snag = json['record'] != null ? SnagModel.fromJson(json['record']) : null;
    code = json['code'];
    meta = json['meta'];
    requestStatus = json['request_status'];
    message = json['message'];
  }
  String? status;
  SnagModel? snag;
  int? code;
  dynamic meta;
  bool? requestStatus;
  String? message;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    if (snag != null) {
      map['record'] = snag?.toJson();
    }
    map['code'] = code;
    map['meta'] = meta;
    map['request_status'] = requestStatus;
    map['message'] = message;
    return map;
  }

}
