import 'package:iskaan_inspections_mobile/model/profile/profile_response_model.dart';
import 'package:iskaan_inspections_mobile/model/user_activity/user_activity_response_model.dart';

abstract class ProfileRepo{
  Future<ProfileResponseModel?> getProfile();
  Future<UserActivityResponseModel?> getUserActivities({int? page});
  Future<ProfileResponseModel?> updateProfile({required Map<String,dynamic> data});
}