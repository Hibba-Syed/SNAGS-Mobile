

import 'package:iskaan_inspections_mobile/model/auth/login_response_model.dart';
import 'package:iskaan_inspections_mobile/model/auth/update_password_response_model.dart';

abstract class AuthRepo{
  Future<LoginResponseModel?> login(Map<String,dynamic> data);
  Future<UpdatePasswordResponseModel?> updatePassword({required Map<String,dynamic> data});
  // Future<AuthResponseModel?> register(Map<String,dynamic> data);
  // Future<SendOtpResponseModel?> sendOtp({required String email});
  // Future<BaseResponseModel?> resetPassword(Map<String, dynamic> data);
}