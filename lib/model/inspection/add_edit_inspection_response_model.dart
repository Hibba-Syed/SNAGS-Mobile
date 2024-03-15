import 'package:iskaan_inspections_mobile/model/inspection/inspection_details_response_model.dart';

class AddEditInspectionResponseModel {
  AddEditInspectionResponseModel({
      this.status, 
      this.record, 
      this.code, 
      this.meta, 
      this.requestStatus, 
      this.message,});

  AddEditInspectionResponseModel.fromJson(dynamic json) {
    status = json['status'];
    record = json['record'] != null ? InspectionDetails.fromJson(json['record']) : null;
    code = json['code'];
    meta = json['meta'];
    requestStatus = json['request_status'];
    message = json['message'];
  }
  String? status;
  InspectionDetails? record;
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


