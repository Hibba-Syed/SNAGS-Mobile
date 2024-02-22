import 'package:iskaan_inspections_mobile/data/network/base_api_services.dart';
import 'package:iskaan_inspections_mobile/data/network/network_api_services.dart';
import 'package:iskaan_inspections_mobile/model/profile/profile_response_model.dart';
import 'package:iskaan_inspections_mobile/repo/profile/profile_repo.dart';
import 'package:iskaan_inspections_mobile/res/constants/api_url.dart';

class ProfileRepoImpl implements ProfileRepo{
  final BaseApiServices _apiService = NetworkApiServices();

  @override
  Future<ProfileResponseModel?> getProfile() async{
    try {
      dynamic response =
          await _apiService.getAuthGetApiResponse(ApiUrl.profile,);
      return ProfileResponseModel.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }

}