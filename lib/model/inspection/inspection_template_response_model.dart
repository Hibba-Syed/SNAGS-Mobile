class InspectionTemplateResponseModel {
  InspectionTemplateResponseModel({
      this.status,
      this.record,
      this.code,
      this.meta,
      this.requestStatus,
      this.message,});

  InspectionTemplateResponseModel.fromJson(dynamic json) {
    status = json['status'];
    record = json['record'] != null ? InspectionTemplateRecord.fromJson(json['record']) : null;
    code = json['code'];
    meta = json['meta'];
    requestStatus = json['request_status'];
    message = json['message'];
  }
  String? status;
  InspectionTemplateRecord? record;
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

class InspectionTemplateRecord {
  InspectionTemplateRecord({
      this.id,
      this.companyId,
      this.associationId,
      this.categories,});

  InspectionTemplateRecord.fromJson(dynamic json) {
    id = json['id'];
    companyId = json['company_id'];
    associationId = json['association_id'];
    if (json['categories'] != null) {
      categories = [];
      json['categories'].forEach((v) {
        categories?.add(InspectionTemplateCategory.fromJson(v));
      });
    }
  }
  int? id;
  int? companyId;
  int? associationId;
  List<InspectionTemplateCategory>? categories;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['company_id'] = companyId;
    map['association_id'] = associationId;
    if (categories != null) {
      map['categories'] = categories?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

class InspectionTemplateCategory {
  InspectionTemplateCategory({
      this.id,
      this.companyId,
      this.inspectionId,
      this.title,
      this.items,});

  InspectionTemplateCategory.fromJson(dynamic json) {
    id = json['id'];
    companyId = json['company_id'];
    inspectionId = json['inspection_id'];
    title = json['title'];
    if (json['items'] != null) {
      items = [];
      json['items'].forEach((v) {
        items?.add(InspectionTemplateCategoryItem.fromJson(v));
      });
    }
  }
  int? id;
  int? companyId;
  int? inspectionId;
  String? title;
  List<InspectionTemplateCategoryItem>? items;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['company_id'] = companyId;
    map['inspection_id'] = inspectionId;
    map['title'] = title;
    if (items != null) {
      map['items'] = items?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

class InspectionTemplateCategoryItem {
  InspectionTemplateCategoryItem({
      this.id,
      this.inspectionCategoryId,
      this.title,});

  InspectionTemplateCategoryItem.fromJson(dynamic json) {
    id = json['id'];
    inspectionCategoryId = json['inspection_category_id'];
    title = json['title'];
  }
  int? id;
  int? inspectionCategoryId;
  String? title;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['inspection_category_id'] = inspectionCategoryId;
    map['title'] = title;
    return map;
  }

}