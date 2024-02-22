import 'dart:convert';
LoginResponseModel loginResponseModelFromJson(String str) => LoginResponseModel.fromJson(json.decode(str));
String loginResponseModelToJson(LoginResponseModel data) => json.encode(data.toJson());
class LoginResponseModel {
  LoginResponseModel({
      this.status, 
      this.requestStatus, 
      this.message, 
      this.code, 
      this.error, 
      this.tokenType, 
      this.expiresIn, 
      this.accessToken,});

  LoginResponseModel.fromJson(dynamic json) {
    status = json['status'];
    requestStatus = json['request_status'];
    message = json['message'];
    code = json['code'];
    error = json['error'] != null ? Error.fromJson(json['error']) : null;
    tokenType = json['token_type'];
    expiresIn = json['expires_in'];
    accessToken = json['access_token'];
  }
  String? status;
  bool? requestStatus;
  String? message;
  int? code;
  Error? error;
  String? tokenType;
  int? expiresIn;
  String? accessToken;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    map['request_status'] = requestStatus;
    map['message'] = message;
    map['code'] = code;
    if (error != null) {
      map['error'] = error?.toJson();
    }
    map['token_type'] = tokenType;
    map['expires_in'] = expiresIn;
    map['access_token'] = accessToken;
    return map;
  }

}

Error errorFromJson(String str) => Error.fromJson(json.decode(str));
String errorToJson(Error data) => json.encode(data.toJson());
class Error {
  Error({
      this.code, 
      this.message, 
      this.errors, 
      this.html,});

  Error.fromJson(dynamic json) {
    code = json['code'];
    message = json['message'];
    errors = json['errors'] != null ? Errors.fromJson(json['errors']) : null;
    html = json['html'];
  }
  String? code;
  String? message;
  Errors? errors;
  String? html;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['code'] = code;
    map['message'] = message;
    if (errors != null) {
      map['errors'] = errors?.toJson();
    }
    map['html'] = html;
    return map;
  }

}

Errors errorsFromJson(String str) => Errors.fromJson(json.decode(str));
String errorsToJson(Errors data) => json.encode(data.toJson());
class Errors {
  Errors({
      this.email,});

  Errors.fromJson(dynamic json) {
    email = json['email'];
  }
  String? email;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['email'] = email;
    return map;
  }

}