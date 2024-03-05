import 'package:iskaan_inspections_mobile/data/network/base_api_services.dart';
import 'package:iskaan_inspections_mobile/data/network/network_api_services.dart';
import 'package:iskaan_inspections_mobile/model/profile/profile_response_model.dart';
import 'package:iskaan_inspections_mobile/model/user_activity/user_activity_response_model.dart';
import 'package:iskaan_inspections_mobile/repo/profile/profile_repo.dart';
import 'package:iskaan_inspections_mobile/res/constants/api_url.dart';

class ProfileRepoImpl implements ProfileRepo {
  final BaseApiServices _apiService = NetworkApiServices();

  @override
  Future<ProfileResponseModel?> getProfile() async {
    try {
      dynamic response = await _apiService.getAuthGetApiResponse(
        ApiUrl.profile,
      );
      return ProfileResponseModel.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<UserActivityResponseModel?> getUserActivities({int? page}) async {
    try {
      String url = "${ApiUrl.activities}?page=${page ?? 1}";
      dynamic response = await _apiService.getAuthGetApiResponse(url);
      return UserActivityResponseModel.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }
  // https://api.oamservices.com/snags/profile/activities?xyz=DXIxj%252BS7OkS2L83fA%252FOJyQ%253D%253D
}
