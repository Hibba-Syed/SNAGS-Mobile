import 'package:iskaan_inspections_mobile/model/association/association_model.dart';
import 'package:iskaan_inspections_mobile/model/company_model.dart';
import 'package:iskaan_inspections_mobile/model/inspector_model.dart';
import 'package:iskaan_inspections_mobile/model/snag/snags_response_model.dart';

class InspectionDetailsResponseModel {
  InspectionDetailsResponseModel({
    this.status,
    this.record,
    this.code,
    this.meta,
    this.requestStatus,
    this.message,
  });

  InspectionDetailsResponseModel.fromJson(dynamic json) {
    status = json['status'];
    record = json['record'] != null
        ? InspectionDetails.fromJson(json['record'])
        : null;
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

class InspectionDetails {
  InspectionDetails({
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
    this.inspector,
    this.categories,
    this.snags,
    this.logs,
  });

  InspectionDetails.fromJson(dynamic json) {
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
    company =
        json['company'] != null ? Company.fromJson(json['company']) : null;
    association = json['association'] != null
        ? Association.fromJson(json['association'])
        : null;
    inspector = json['inspector'] != null
        ? Inspector.fromJson(json['inspector'])
        : null;
    if (json['categories'] != null) {
      categories = [];
      json['categories'].forEach((v) {
        categories?.add(Category.fromJson(v));
      });
    }
    if (json['snags'] != null) {
      snags = [];
      json['snags'].forEach((v) {
        snags?.add(SnagModel.fromJson(v));
      });
    }
    if (json['logs'] != null) {
      logs = [];
      json['logs'].forEach((v) {
        logs?.add(Logs.fromJson(v));
      });
    }
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
  List<Category>? categories;
  List<SnagModel>? snags;
  List<Logs>? logs;

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
    if (categories != null) {
      map['categories'] = categories?.map((v) => v.toJson()).toList();
    }
    if (snags != null) {
      map['snags'] = snags?.map((v) => v.toJson()).toList();
    }
    if (logs != null) {
      map['logs'] = logs?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

class Logs {
  Logs({
    this.id,
    this.companyId,
    this.associationId,
    this.description,
    this.status,
    this.detailText,
    this.detailHtml,
    this.createdAt,
    this.logger,
  });

  Logs.fromJson(dynamic json) {
    id = json['id'];
    companyId = json['company_id'];
    associationId = json['association_id'];
    description = json['description'];
    status = json['status'];
    detailText = json['detail_text'];
    detailHtml = json['detail_html'];
    createdAt = json['created_at'];
    logger = json['logger'] != null ? Logger.fromJson(json['logger']) : null;
  }
  int? id;
  int? companyId;
  int? associationId;
  String? description;
  String? status;
  String? detailText;
  String? detailHtml;
  String? createdAt;
  Logger? logger;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['company_id'] = companyId;
    map['association_id'] = associationId;
    map['description'] = description;
    map['status'] = status;
    map['detail_text'] = detailText;
    map['detail_html'] = detailHtml;
    map['created_at'] = createdAt;
    if (logger != null) {
      map['logger'] = logger?.toJson();
    }
    return map;
  }
}

class Logger {
  Logger({
    this.id,
    this.name,
    this.type,
    this.profilePicture,
  });

  Logger.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    type = json['type'];
    profilePicture = json['profile_picture'];
  }
  int? id;
  String? name;
  String? type;
  String? profilePicture;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['type'] = type;
    map['profile_picture'] = profilePicture;
    return map;
  }
}

class Category {
  Category({
    this.id,
    this.companyId,
    this.inspectionId,
    this.inspectorId,
    this.title,
    this.score,
    this.note,
    this.isDone,
    this.inspector,
    this.items,
  });

  Category.fromJson(dynamic json) {
    id = json['id'];
    companyId = json['company_id'];
    inspectionId = json['inspection_id'];
    inspectorId = json['inspector_id'];
    title = json['title'];
    score = json['score'];
    note = json['note'];
    isDone = json['is_done'];
    inspector = json['inspector'] != null
        ? Inspector.fromJson(json['inspector'])
        : null;
    if (json['items'] != null) {
      items = [];
      json['items'].forEach((v) {
        items?.add(Item.fromJson(v));
      });
    }
  }
  int? id;
  int? companyId;
  int? inspectionId;
  int? inspectorId;
  String? title;
  dynamic score;
  dynamic note;
  bool? isDone;
  Inspector? inspector;
  List<Item>? items;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['company_id'] = companyId;
    map['inspection_id'] = inspectionId;
    map['inspector_id'] = inspectorId;
    map['title'] = title;
    map['score'] = score;
    map['note'] = note;
    map['is_done'] = isDone;
    if (inspector != null) {
      map['inspector'] = inspector?.toJson();
    }
    if (items != null) {
      map['items'] = items?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

class Item {
  Item({
    this.id,
    this.inspectionCategoryId,
    this.title,
    this.rating,
    this.note,
  });

  Item.fromJson(dynamic json) {
    id = json['id'];
    inspectionCategoryId = json['inspection_category_id'];
    title = json['title'];
    rating = json['rating'];
    note = json['note'];
  }
  int? id;
  int? inspectionCategoryId;
  String? title;
  int? rating;
  dynamic note;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['inspection_category_id'] = inspectionCategoryId;
    map['title'] = title;
    map['rating'] = rating;
    map['note'] = note;
    return map;
  }
}
