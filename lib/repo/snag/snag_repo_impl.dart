import 'dart:convert';

import 'package:iskaan_inspections_mobile/data/network/base_api_services.dart';
import 'package:iskaan_inspections_mobile/data/network/network_api_services.dart';
import 'package:iskaan_inspections_mobile/model/snag/snag_details_response_model.dart';
import 'package:iskaan_inspections_mobile/model/snag/snags_response_model.dart';
import 'package:iskaan_inspections_mobile/model/snag/snags_statistics_by_month_response_model.dart';
import 'package:iskaan_inspections_mobile/model/snag/snags_statistics_response_model.dart';
import 'package:iskaan_inspections_mobile/repo/snag/snag_repo.dart';
import 'package:iskaan_inspections_mobile/res/constants/api_url.dart';

class SnagRepoImpl implements SnagRepo {
  final BaseApiServices _apiService = NetworkApiServices();
  @override
  Future<SnagsStatisticsResponseModel?> getSnagsStatistics(
      {int? months}) async {
    try {
      String url = '${ApiUrl.snagsStatistics}?months=${months ?? ''}';
      dynamic response = await _apiService.getAuthGetApiResponse(url);
      return SnagsStatisticsResponseModel.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<SnagsResponseModel?> getSnags({
    int? page,
    int? limit,
    List<int>? associationIds,
    List<int>? companyIds,
    List<String>? statuses,
    String? fromDate,
    String? toDate,
  }) async {
    try {
      String? associationIdsString = associationIds?.join(',');
      String? companyIdsString = companyIds?.join(',');
      String? statusesString = statuses?.join(',');
      String url =
          '${ApiUrl.snags}?page=${page ?? 1}&limit=${limit ?? 10}&association_ids=${associationIdsString ?? ''}&company_ids=${companyIdsString ?? ''}&status=${statusesString ?? ''}&from_date=${fromDate ?? ''}&to_date=${toDate ?? ''}&order_by=association_name&order_dir=desc';
      dynamic response = await _apiService.getAuthGetApiResponse(url);
      return SnagsResponseModel.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<SnagDetailsResponseModel?> getSnagDetails({required int id}) async {
    try {
      String url = '${ApiUrl.snags}/$id';
      dynamic response = await _apiService.getAuthGetApiResponse(url);
      return SnagDetailsResponseModel.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<SnagsStatisticsByMonthResponseModel?>
      getSnagsStatisticsByMonth() async {
    try {
      String url = '${ApiUrl.snagsStatisticsByMonth}?months=12';
      dynamic response = await _apiService.getAuthGetApiResponse(url);
      return SnagsStatisticsByMonthResponseModel.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }
}
