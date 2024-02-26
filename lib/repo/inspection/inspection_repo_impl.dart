import 'package:iskaan_inspections_mobile/data/network/base_api_services.dart';
import 'package:iskaan_inspections_mobile/data/network/network_api_services.dart';
import 'package:iskaan_inspections_mobile/model/inspection/inspections_response_model.dart';
import 'package:iskaan_inspections_mobile/model/inspection/inspections_statistics_response_model.dart';
import 'package:iskaan_inspections_mobile/repo/inspection/inspection_repo.dart';
import 'package:iskaan_inspections_mobile/res/constants/api_url.dart';

class InspectionRepoImpl implements InspectionRepo {
  final BaseApiServices _apiService = NetworkApiServices();
  @override
  Future<InspectionsStatisticsResponseModel?> getInspectionsStatistics({String? filter}) async {
    try {
      String url = '${ApiUrl.inspectionsStatistics}?xyz=filter';
      dynamic response =
          await _apiService.getAuthGetApiResponse(url);
      return InspectionsStatisticsResponseModel.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<InspectionsResponseModel?> getInspections({String? filter}) async {
    try {
      String url = '${ApiUrl.inspections}?xyz=filter';
      dynamic response =
      await _apiService.getAuthGetApiResponse(url);
      return InspectionsResponseModel.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }
}
