import 'package:iskaan_inspections_mobile/model/association_model.dart';
import 'package:iskaan_inspections_mobile/model/company_model.dart';
import 'package:iskaan_inspections_mobile/model/inspection/inspections_response_model.dart';
import 'package:iskaan_inspections_mobile/model/inspector_model.dart';

class SnagsResponseModel {
  SnagsResponseModel({
    this.status,
    this.record,
    this.code,
    this.meta,
    this.requestStatus,
    this.message,
  });

  SnagsResponseModel.fromJson(dynamic json) {
    status = json['status'];
    if (json['record'] != null) {
      record = [];
      json['record'].forEach((v) {
        record?.add(SnagModel.fromJson(v));
      });
    }
    code = json['code'];
    meta = json['meta'] != null ? Meta.fromJson(json['meta']) : null;
    requestStatus = json['request_status'];
    message = json['message'];
  }
  String? status;
  List<SnagModel>? record;
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

class SnagModel {
  SnagModel({
    this.id,
    this.companyId,
    this.associationId,
    this.inspectorId,
    this.reference,
    this.status,
    this.risk,
    this.title,
    this.description,
    this.closeNote,
    this.location,
    this.createdAt,
    this.updatedAt,
    this.inspection,
    this.company,
    this.association,
    this.inspector,
    this.images,
    this.closingImages,
  });

  SnagModel.fromJson(dynamic json) {
    id = json['id'];
    companyId = json['company_id'];
    associationId = json['association_id'];
    inspectorId = json['inspector_id'];
    reference = json['reference'];
    status = json['status'];
    risk = json['risk'];
    title = json['title'];
    description = json['description'];
    closeNote = json['close_note'];
    location = json['location'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    inspection = json['inspection'] != null
        ? InspectionModel.fromJson(json['inspection'])
        : null;
    company =
        json['company'] != null ? Company.fromJson(json['company']) : null;
    association = json['association'] != null
        ? Association.fromJson(json['association'])
        : null;
    inspector = json['inspector'] != null
        ? Inspector.fromJson(json['inspector'])
        : null;
    if (json['images'] != null) {
      images = [];
      json['images'].forEach((v) {
        images?.add(ImageModel.fromJson(v));
      });
    }
    if (json['closing_images'] != null) {
      closingImages = [];
      json['closing_images'].forEach((v) {
        closingImages?.add(ImageModel.fromJson(v));
      });
    }
  }
  int? id;
  int? companyId;
  int? associationId;
  int? inspectorId;
  String? reference;
  String? status;
  String? risk;
  String? title;
  String? description;
  dynamic closeNote;
  String? location;
  String? createdAt;
  String? updatedAt;
  InspectionModel? inspection;
  Company? company;
  Association? association;
  Inspector? inspector;
  List<ImageModel>? images;
  List<ImageModel>? closingImages;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['company_id'] = companyId;
    map['association_id'] = associationId;
    map['inspector_id'] = inspectorId;
    map['reference'] = reference;
    map['status'] = status;
    map['risk'] = risk;
    map['title'] = title;
    map['description'] = description;
    map['close_note'] = closeNote;
    map['location'] = location;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    if (inspection != null) {
      map['inspection'] = inspection?.toJson();
    }
    if (company != null) {
      map['company'] = company?.toJson();
    }
    if (association != null) {
      map['association'] = association?.toJson();
    }
    if (inspector != null) {
      map['inspector'] = inspector?.toJson();
    }
    if (images != null) {
      map['images'] = images?.map((v) => v.toJson()).toList();
    }
    if (closingImages != null) {
      map['closing_images'] = closingImages?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

class ImageModel {
  ImageModel({
    this.id,
    this.path,
    this.name,
    this.size,
    this.createdAt,
    this.updatedAt,
  });

  ImageModel.fromJson(dynamic json) {
    id = json['id'];
    path = json['path'];
    name = json['name'];
    size = json['size'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }
  int? id;
  String? path;
  String? name;
  int? size;
  String? createdAt;
  String? updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['path'] = path;
    map['name'] = name;
    map['size'] = size;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    return map;
  }
}

