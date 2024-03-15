import 'package:iskaan_inspections_mobile/model/inspector_model.dart';

class InspectorsResponseModel {
  InspectorsResponseModel({
    this.status,
    this.inspectors,
    this.code,
    this.meta,
    this.requestStatus,
    this.message,
  });

  InspectorsResponseModel.fromJson(dynamic json) {
    status = json['status'];
    if (json['record'] != null) {
      inspectors = [];
      json['record'].forEach((v) {
        inspectors?.add(Inspector.fromJson(v));
      });
    }
    code = json['code'];
    meta = json['meta'];
    requestStatus = json['request_status'];
    message = json['message'];
  }
  String? status;
  List<Inspector>? inspectors;
  int? code;
  dynamic meta;
  bool? requestStatus;
  String? message;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    if (inspectors != null) {
      map['record'] = inspectors?.map((v) => v.toJson()).toList();
    }
    map['code'] = code;
    map['meta'] = meta;
    map['request_status'] = requestStatus;
    map['message'] = message;
    return map;
  }
}
