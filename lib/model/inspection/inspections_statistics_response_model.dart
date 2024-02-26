class InspectionsStatisticsResponseModel {
  InspectionsStatisticsResponseModel({
      this.status, 
      this.record, 
      this.code, 
      this.meta, 
      this.requestStatus, 
      this.message,});

  InspectionsStatisticsResponseModel.fromJson(dynamic json) {
    status = json['status'];
    record = json['record'] != null ? InspectionsStatisticsRecord.fromJson(json['record']) : null;
    code = json['code'];
    meta = json['meta'];
    requestStatus = json['request_status'];
    message = json['message'];
  }
  String? status;
  InspectionsStatisticsRecord? record;
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

class InspectionsStatisticsRecord {
  InspectionsStatisticsRecord({
      this.inspectionReportsCount, 
      this.newInspectionReportsCount, 
      this.submittedInspectionReportsCount, 
      this.rejectedInspectionReportsCount, 
      this.approvedInspectionReportsCount,});

  InspectionsStatisticsRecord.fromJson(dynamic json) {
    inspectionReportsCount = json['inspection_reports_count'];
    newInspectionReportsCount = json['new_inspection_reports_count'];
    submittedInspectionReportsCount = json['submitted_inspection_reports_count'];
    rejectedInspectionReportsCount = json['rejected_inspection_reports_count'];
    approvedInspectionReportsCount = json['approved_inspection_reports_count'];
  }
  int? inspectionReportsCount;
  int? newInspectionReportsCount;
  int? submittedInspectionReportsCount;
  int? rejectedInspectionReportsCount;
  int? approvedInspectionReportsCount;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['inspection_reports_count'] = inspectionReportsCount;
    map['new_inspection_reports_count'] = newInspectionReportsCount;
    map['submitted_inspection_reports_count'] = submittedInspectionReportsCount;
    map['rejected_inspection_reports_count'] = rejectedInspectionReportsCount;
    map['approved_inspection_reports_count'] = approvedInspectionReportsCount;
    return map;
  }

}