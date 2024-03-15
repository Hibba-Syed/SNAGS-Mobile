class UserActivityResponseModel {
  UserActivityResponseModel({
      this.status, 
      this.record, 
      this.code, 
      this.meta, 
      this.requestStatus, 
      this.message,});

  UserActivityResponseModel.fromJson(dynamic json) {
    status = json['status'];
    if (json['record'] != null) {
      record = [];
      json['record'].forEach((v) {
        record?.add(UserActivityModel.fromJson(v));
      });
    }
    code = json['code'];
    meta = json['meta'] != null ? Meta.fromJson(json['meta']) : null;
    requestStatus = json['request_status'];
    message = json['message'];
  }
  String? status;
  List<UserActivityModel>? record;
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

class UserActivityModel {
  UserActivityModel({
      this.id, 
      this.companyId, 
      this.associationId, 
      this.description, 
      this.status, 
      this.detailText, 
      this.detailHtml, 
      this.createdAt, 
      this.logable, 
      this.logger,});

  UserActivityModel.fromJson(dynamic json) {
    id = json['id'];
    companyId = json['company_id'];
    associationId = json['association_id'];
    description = json['description'];
    status = json['status'];
    detailText = json['detail_text'];
    detailHtml = json['detail_html'];
    createdAt = json['created_at'];
    logable = json['logable'] != null ? Logable.fromJson(json['logable']) : null;
    logger = json['logger'] != null ? Logger.fromJson(json['logger']) : null;
  }
  int? id;
  int? companyId;
  int? associationId;
  String? description;
  String? status;
  dynamic detailText;
  String? detailHtml;
  String? createdAt;
  Logable? logable;
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
    if (logable != null) {
      map['logable'] = logable?.toJson();
    }
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
      this.profilePicture,});

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

class Logable {
  Logable({
      this.id, 
      this.name, 
      this.type,});

  Logable.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    type = json['type'];
  }
  int? id;
  String? name;
  String? type;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['type'] = type;
    return map;
  }

}