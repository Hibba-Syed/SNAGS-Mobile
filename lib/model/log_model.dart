class LogModel {
  LogModel({
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

  LogModel.fromJson(dynamic json) {
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

