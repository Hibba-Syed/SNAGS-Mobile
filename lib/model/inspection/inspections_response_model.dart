import 'package:iskaan_inspections_mobile/model/association_model.dart';
import 'package:iskaan_inspections_mobile/model/company_model.dart';
import 'package:iskaan_inspections_mobile/model/inspector_model.dart';

class InspectionsResponseModel {
  InspectionsResponseModel({
      this.status, 
      this.record, 
      this.code, 
      this.meta, 
      this.requestStatus, 
      this.message,});

  InspectionsResponseModel.fromJson(dynamic json) {
    status = json['status'];
    if (json['record'] != null) {
      record = [];
      json['record'].forEach((v) {
        record?.add(InspectionModel.fromJson(v));
      });
    }
    code = json['code'];
    meta = json['meta'] != null ? Meta.fromJson(json['meta']) : null;
    requestStatus = json['request_status'];
    message = json['message'];
  }
  String? status;
  List<InspectionModel>? record;
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
      this.isFirstPage,});

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
  dynamic limit;
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

class InspectionModel {
  InspectionModel({
      this.id, 
      this.companyId, 
      this.associationId, 
      this.inspectorId, 
      this.reference, 
      this.score, 
      this.status, 
      this.createdAt, 
      this.updatedAt, 
      this.deletedAt, 
      this.company, 
      this.association, 
      this.inspector,});

  InspectionModel.fromJson(dynamic json) {
    id = json['id'];
    companyId = json['company_id'];
    associationId = json['association_id'];
    inspectorId = json['inspector_id'];
    reference = json['reference'];
    score = json['score'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
    company = json['company'] != null ? Company.fromJson(json['company']) : null;
    association = json['association'] != null ? Association.fromJson(json['association']) : null;
    inspector = json['inspector'] != null ? Inspector.fromJson(json['inspector']) : null;
  }
  int? id;
  int? companyId;
  int? associationId;
  int? inspectorId;
  String? reference;
  dynamic score;
  String? status;
  String? createdAt;
  String? updatedAt;
  dynamic deletedAt;
  Company? company;
  Association? association;
  Inspector? inspector;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['company_id'] = companyId;
    map['association_id'] = associationId;
    map['inspector_id'] = inspectorId;
    map['reference'] = reference;
    map['score'] = score;
    map['status'] = status;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    map['deleted_at'] = deletedAt;
    if (company != null) {
      map['company'] = company?.toJson();
    }
    if (association != null) {
      map['association'] = association?.toJson();
    }
    if (inspector != null) {
      map['inspector'] = inspector?.toJson();
    }
    return map;
  }

}



