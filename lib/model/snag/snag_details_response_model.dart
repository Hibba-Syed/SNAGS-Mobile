import 'package:iskaan_inspections_mobile/model/association/association_model.dart';
import 'package:iskaan_inspections_mobile/model/company_model.dart';
import 'package:iskaan_inspections_mobile/model/inspection/inspections_response_model.dart';
import 'package:iskaan_inspections_mobile/model/inspector_model.dart';
import 'package:iskaan_inspections_mobile/model/log_model.dart';
import 'package:iskaan_inspections_mobile/model/snag/snags_response_model.dart';

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
    record = json['record'] != null ? SnagDetails.fromJson(json['record']) : null;
    code = json['code'];
    meta = json['meta'];
    requestStatus = json['request_status'];
    message = json['message'];
  }
  String? status;
  SnagDetails? record;
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

class SnagDetails {
  SnagDetails({
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
      this.comments, 
      this.logs,});

  SnagDetails.fromJson(dynamic json) {
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
    inspection = json['inspection'] != null ? InspectionModel.fromJson(json['inspection']) : null;
    company = json['company'] != null ? Company.fromJson(json['company']) : null;
    association = json['association'] != null ? Association.fromJson(json['association']) : null;
    inspector = json['inspector'] != null ? Inspector.fromJson(json['inspector']) : null;
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
    if (json['comments'] != null) {
      comments = [];
      json['comments'].forEach((v) {
        comments?.add(Comment.fromJson(v));
      });
    }
    if (json['logs'] != null) {
      logs = [];
      json['logs'].forEach((v) {
        logs?.add(LogModel.fromJson(v));
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
  List<Comment>? comments;
  List<LogModel>? logs;

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
    if (comments != null) {
      map['comments'] = comments?.map((v) => v.toJson()).toList();
    }
    if (logs != null) {
      map['logs'] = logs?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}



class Comment {
  Comment({
      this.id, 
      this.comment, 
      this.commenter, 
      this.createdAt, 
      this.updatedAt,});

  Comment.fromJson(dynamic json) {
    id = json['id'];
    comment = json['comment'];
    commenter = json['commenter'] != null ? Commenter.fromJson(json['commenter']) : null;
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }
  int? id;
  String? comment;
  Commenter? commenter;
  String? createdAt;
  String? updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['comment'] = comment;
    if (commenter != null) {
      map['commenter'] = commenter?.toJson();
    }
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    return map;
  }

}

class Commenter {
  Commenter({
      this.id, 
      this.name, 
      this.type, 
      this.profilePicture,});

  Commenter.fromJson(dynamic json) {
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
