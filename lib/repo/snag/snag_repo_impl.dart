import 'package:iskaan_inspections_mobile/data/network/base_api_services.dart';
import 'package:iskaan_inspections_mobile/data/network/network_api_services.dart';
import 'package:iskaan_inspections_mobile/model/snag/snags_response_model.dart';
import 'package:iskaan_inspections_mobile/model/snag/snags_statistics_response_model.dart';
import 'package:iskaan_inspections_mobile/repo/snag/snag_repo.dart';
import 'package:iskaan_inspections_mobile/res/constants/api_url.dart';

class SnagRepoImpl implements SnagRepo {
  final BaseApiServices _apiService = NetworkApiServices();
  @override
  Future<SnagsStatisticsResponseModel?> getSnagsStatistics({String? filter}) async {
    try {
      String url = '${ApiUrl.snagsStatistics}?xyz=filter';
      dynamic response =
          await _apiService.getAuthGetApiResponse(url);
      return SnagsStatisticsResponseModel.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<SnagsResponseModel?> getSnags({String? filter}) async {
    try {
      String url = '${ApiUrl.snags}?xyz=filter';
      dynamic response =
      await _apiService.getAuthGetApiResponse(url);
      return SnagsResponseModel.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }
}
