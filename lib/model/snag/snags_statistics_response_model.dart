class SnagsStatisticsResponseModel {
  SnagsStatisticsResponseModel({
      this.status, 
      this.record, 
      this.code, 
      this.meta, 
      this.requestStatus, 
      this.message,});

  SnagsStatisticsResponseModel.fromJson(dynamic json) {
    status = json['status'];
    record = json['record'] != null ? SnagsStatisticsRecord.fromJson(json['record']) : null;
    code = json['code'];
    meta = json['meta'];
    requestStatus = json['request_status'];
    message = json['message'];
  }
  String? status;
  SnagsStatisticsRecord? record;
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

class SnagsStatisticsRecord {
  SnagsStatisticsRecord({
      this.snagsCount, 
      this.newSnagsCount, 
      this.inProgressSnagsCount, 
      this.completedSnagsCount, 
      this.cancelledSnagsCount,});

  SnagsStatisticsRecord.fromJson(dynamic json) {
    print('json:: $json');
    snagsCount = json['snags_count'];
    newSnagsCount = json['new_snags_count'];
    inProgressSnagsCount = json['in_progress_snags_count'];
    completedSnagsCount = json['completed_snags_count'];
    cancelledSnagsCount = json['cancelled_snags_count'];
  }
  int? snagsCount;
  int? newSnagsCount;
  int? inProgressSnagsCount;
  int? completedSnagsCount;
  int? cancelledSnagsCount;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['snags_count'] = snagsCount;
    map['new_snags_count'] = newSnagsCount;
    map['in_progress_snags_count'] = inProgressSnagsCount;
    map['completed_snags_count'] = completedSnagsCount;
    map['cancelled_snags_count'] = cancelledSnagsCount;
    return map;
  }

}