import 'package:iskaan_inspections_mobile/model/company_model.dart';
import 'package:iskaan_inspections_mobile/model/permission_model.dart';

class RoleModel {
  RoleModel({
    this.title,
    this.description,
    this.company,
    this.permissions,});

  RoleModel.fromJson(dynamic json) {
    title = json['title'];
    description = json['description'];
    company = json['company'] != null ? Company.fromJson(json['company']) : null;
    if (json['permissions'] != null) {
      permissions = [];
      json['permissions'].forEach((v) {
        permissions?.add(Permission.fromJson(v));
      });
    }
  }
  String? title;
  dynamic description;
  Company? company;
  List<Permission>? permissions;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['title'] = title;
    map['description'] = description;
    if (company != null) {
      map['company'] = company?.toJson();
    }
    if (permissions != null) {
      map['permissions'] = permissions?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}
