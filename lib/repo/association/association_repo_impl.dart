import 'package:iskaan_inspections_mobile/data/network/base_api_services.dart';
import 'package:iskaan_inspections_mobile/data/network/network_api_services.dart';
import 'package:iskaan_inspections_mobile/model/association/associations_response_model.dart';
import 'package:iskaan_inspections_mobile/model/inspection/inspections_statistics_response_model.dart';
import 'package:iskaan_inspections_mobile/model/snag/snags_statistics_response_model.dart';
import 'package:iskaan_inspections_mobile/repo/association/association_repo.dart';
import 'package:iskaan_inspections_mobile/res/constants/api_url.dart';

class AssociationRepoImpl implements AssociationRepo {
  final BaseApiServices _apiService = NetworkApiServices();
  @override
  Future<AssociationsResponseModel?> getAssociations({int? page}) async {
    try {
      String url = ApiUrl.associations;
      dynamic response = await _apiService.getAuthGetApiResponse(url);
      return AssociationsResponseModel.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<InspectionsStatisticsResponseModel?> getCommunityInspectionsStatistics(
      {int? months}) async {
    try {
      String url =
          '${ApiUrl.associationInspectionsStatistics}?months=${months ?? 12}';
      dynamic response = await _apiService.getAuthGetApiResponse(url);
      return InspectionsStatisticsResponseModel.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<SnagsStatisticsResponseModel?> getCommunitySnagsStatistics(
      {int? months}) async {
    try {
      String url = '${ApiUrl.associationSnagsStatistics}?months=${months ?? 12}';
      dynamic response = await _apiService.getAuthGetApiResponse(url);
      return SnagsStatisticsResponseModel.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }
}
