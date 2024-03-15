
import 'package:iskaan_inspections_mobile/model/snag/snag_model.dart';

class SnagDetailsResponseModel {
  SnagDetailsResponseModel({
      this.status, 
      this.record, 
      this.code, 
      this.meta, 
      this.requestStatus, 
      this.message,});

  SnagDetailsResponseModel.fromJson(dynamic json) {
    status = json['status'];
    record = json['record'] != null ? SnagModel.fromJson(json['record']) : null;
    code = json['code'];
    meta = json['meta'];
    requestStatus = json['request_status'];
    message = json['message'];
  }
  String? status;
  SnagModel? record;
  int? code;
  dynamic meta;
  bool? requestStatus;
  String? message;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    if (record != null) {
      map['record'] = record?.toJson();
    }
    map['code'] = code;
    map['meta'] = meta;
    map['request_status'] = requestStatus;
    map['message'] = message;
    return map;
  }

}





