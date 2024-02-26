import 'package:iskaan_inspections_mobile/model/association/association_model.dart';

class AssociationsResponseModel {
  AssociationsResponseModel({
    this.status,
    this.record,
    this.code,
    this.meta,
    this.requestStatus,
    this.message,
  });

  AssociationsResponseModel.fromJson(dynamic json) {
    status = json['status'];
    if (json['record'] != null) {
      record = [];
      json['record'].forEach((v) {
        record?.add(Association.fromJson(v));
      });
    }
    code = json['code'];
    meta = json['meta'] != null ? Meta.fromJson(json['meta']) : null;
    requestStatus = json['request_status'];
    message = json['message'];
  }
  String? status;
  List<Association>? record;
  int? code;
  Meta? meta;
  bool? requestStatus;
  String? message;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    if (record != null) {
      map['record'] = record?.map((v) => v.toJson()).toList();
    }
    map['code'] = code;
    if (meta != null) {
      map['meta'] = meta?.toJson();
    }
    map['request_status'] = requestStatus;
    map['message'] = message;
    return map;
  }
}

class Meta {
  Meta({
    this.page,
    this.lastPage,
    this.from,
    this.to,
    this.limit,
    this.total,
    this.hasMorePages,
    this.isFirstPage,
  });

  Meta.fromJson(dynamic json) {
    page = json['page'];
    lastPage = json['last_page'];
    from = json['from'];
    to = json['to'];
    limit = json['limit'];
    total = json['total'];
    hasMorePages = json['has_more_pages'];
    isFirstPage = json['is_first_page'];
  }
  int? page;
  int? lastPage;
  int? from;
  int? to;
  int? limit;
  int? total;
  bool? hasMorePages;
  bool? isFirstPage;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['page'] = page;
    map['last_page'] = lastPage;
    map['from'] = from;
    map['to'] = to;
    map['limit'] = limit;
    map['total'] = total;
    map['has_more_pages'] = hasMorePages;
    map['is_first_page'] = isFirstPage;
    return map;
  }
}
