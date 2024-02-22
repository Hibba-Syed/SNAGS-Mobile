import 'package:iskaan_inspections_mobile/data/network/base_api_services.dart';
import 'package:iskaan_inspections_mobile/data/network/network_api_services.dart';
import 'package:iskaan_inspections_mobile/model/auth/login_response_model.dart';
import 'package:iskaan_inspections_mobile/repo/auth/auth_repo.dart';
import 'package:iskaan_inspections_mobile/res/constants/api_url.dart';

class AuthRepoImpl implements AuthRepo {
  final BaseApiServices _apiService = NetworkApiServices();
  @override
  Future<LoginResponseModel?> login(Map<String, dynamic> data) async {
    try {
      dynamic response =
          await _apiService.getPostApiResponse(ApiUrl.login, data);
      return LoginResponseModel.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }
  //
  // @override
  // Future<AuthResponseModel?> register(Map<String, dynamic> data) async {
  //   try {
  //     dynamic response =
  //         await _apiService.getPostApiResponse(ApiUrl.register, data);
  //     return AuthResponseModel.fromJson(response);
  //   } catch (e) {
  //     rethrow;
  //   }
  // }
  //
  // @override
  // Future<SendOtpResponseModel?> sendOtp({required String email}) async {
  //   try {
  //     dynamic response = await _apiService.getPostApiResponse(
  //       ApiUrl.sendOtp,
  //       {
  //         'email_address': email,
  //       },
  //     );
  //     return SendOtpResponseModel.fromJson(response);
  //   } catch (e) {
  //     rethrow;
  //   }
  // }
  // @override
  // Future<BaseResponseModel?> resetPassword(Map<String, dynamic> data) async {
  //   try {
  //     dynamic response =
  //     await _apiService.getPostApiResponse(ApiUrl.resetPassword, data);
  //     return BaseResponseModel.fromJson(response);
  //   } catch (e) {
  //     rethrow;
  //   }
  // }
}
