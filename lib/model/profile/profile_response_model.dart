import 'package:iskaan_inspections_mobile/model/association/association_model.dart';
import 'package:iskaan_inspections_mobile/model/company_model.dart';
import 'package:iskaan_inspections_mobile/model/role_model.dart';

class ProfileResponseModel {
  ProfileResponseModel({
      this.status, 
      this.record, 
      this.code, 
      this.meta, 
      this.requestStatus, 
      this.message,});

  ProfileResponseModel.fromJson(dynamic json) {
    status = json['status'];
    record = json['record'] != null ? ProfileRecord.fromJson(json['record']) : null;
    code = json['code'];
    meta = json['meta'];
    requestStatus = json['request_status'];
    message = json['message'];
  }
  String? status;
  ProfileRecord? record;
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
class ProfileRecord {
  ProfileRecord({
      this.id, 
      this.email, 
      this.firstName, 
      this.lastName, 
      this.fullName, 
      this.profilePicture, 
      this.emailVerified, 
      this.associations, 
      this.companies, 
      this.permissions, 
      this.roles,});

  ProfileRecord.fromJson(dynamic json) {
    id = json['id'];
    email = json['email'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    fullName = json['full_name'];
    profilePicture = json['profile_picture'];
    emailVerified = json['email_verified'];
    if (json['associations'] != null) {
      associations = [];
      json['associations'].forEach((v) {
        associations?.add(Association.fromJson(v));
      });
    }
    if (json['companies'] != null) {
      companies = [];
      json['companies'].forEach((v) {
        companies?.add(Company.fromJson(v));
      });
    }
    permissions = json['permissions'] != null ? json['permissions'].cast<String>() : [];
    if (json['roles'] != null) {
      roles = [];
      json['roles'].forEach((v) {
        roles?.add(RoleModel.fromJson(v));
      });
    }
  }
  int? id;
  String? email;
  String? firstName;
  String? lastName;
  String? fullName;
  String? profilePicture;
  bool? emailVerified;
  List<Association>? associations;
  List<Company>? companies;
  List<String>? permissions;
  List<RoleModel>? roles;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['email'] = email;
    map['first_name'] = firstName;
    map['last_name'] = lastName;
    map['full_name'] = fullName;
    map['profile_picture'] = profilePicture;
    map['email_verified'] = emailVerified;
    if (associations != null) {
      map['associations'] = associations?.map((v) => v.toJson()).toList();
    }
    if (companies != null) {
      map['companies'] = companies?.map((v) => v.toJson()).toList();
    }
    map['permissions'] = permissions;
    if (roles != null) {
      map['roles'] = roles?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}




