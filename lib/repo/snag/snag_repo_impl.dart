import 'dart:developer';

import 'package:iskaan_inspections_mobile/data/network/base_api_services.dart';
import 'package:iskaan_inspections_mobile/data/network/network_api_services.dart';
import 'package:iskaan_inspections_mobile/model/snag/add_edit_snag_response_model.dart';
import 'package:iskaan_inspections_mobile/model/snag/complete_snag_response_model.dart';
import 'package:iskaan_inspections_mobile/model/snag/merge_snag_response_model.dart';
import 'package:iskaan_inspections_mobile/model/snag/snag_details_response_model.dart';
import 'package:iskaan_inspections_mobile/model/snag/snags_response_model.dart';
import 'package:iskaan_inspections_mobile/model/snag/snags_statistics_by_month_response_model.dart';
import 'package:iskaan_inspections_mobile/model/snag/snags_statistics_response_model.dart';
import 'package:iskaan_inspections_mobile/model/snag/start_snag_response_model.dart';
import 'package:iskaan_inspections_mobile/repo/snag/snag_repo.dart';
import 'package:iskaan_inspections_mobile/res/constants/api_url.dart';
import 'package:http/http.dart' as http;

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
    String? keyword,
  }) async {
    try {
      String? associationIdsString = associationIds?.join(',');
      String? companyIdsString = companyIds?.join(',');
      String? statusesString = statuses?.join(',');
      String url =
          '${ApiUrl.snags}?page=${page ?? 1}&limit=${limit ?? 10}&association_ids=${associationIdsString ?? ''}&company_ids=${companyIdsString ?? ''}&status=${statusesString ?? ''}&from_date=${fromDate ?? ''}&to_date=${toDate ?? ''}&order_by=created_at&order_dir=desc&key_word=${keyword ?? ''}';
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

  @override
  Future<AddEditSnagResponseModel?> addSnag({
    required Map<String, dynamic> data,
    required List<http.MultipartFile> files,
  }) async {
    try {
      String url = ApiUrl.snags;
      dynamic response = await _apiService.getAuthPostApiMultipartResponse(
        url,
        data,
        files,
      );
      return AddEditSnagResponseModel.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<AddEditSnagResponseModel?> updateSnag({
    required int id,
    required Map<String, dynamic> data,
    required List<http.MultipartFile> files,
  }) async {
    try {
      String url = '${ApiUrl.snags}/$id?_method=PUT';
      dynamic response = await _apiService.getAuthPostApiMultipartResponse(
        url,
        data,
        files,
      );
      return AddEditSnagResponseModel.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<MergeSnagResponseModel?> mergeSnags({
    required int? snagId,
    required List<int> snagsToMergeIds,
    required String note,
  }) async {
    try {
      String url = '${ApiUrl.snags}/$snagId/merge?_method=PUT';
      Map<String, dynamic> data = {
        'note': note,
        'other_snags_ids': snagsToMergeIds,
      };
      dynamic response = await _apiService.getAuthPostApiResponse(
        url,
        data,
      );
      return MergeSnagResponseModel.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<StartSnagResponseModel?> startSnag({required int id}) async {
    try {
      String url = '${ApiUrl.snags}/$id/start?_method=PUT';
      dynamic response = await _apiService.getAuthPostApiResponse(
        url,
        {},
      );
      return StartSnagResponseModel.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<CompleteSnagResponseModel?> completeSnag({
    required int id,
    required String note,
    required List<http.MultipartFile> files,
  }) async {
    try {
      String url = '${ApiUrl.snags}/$id/complete?_method=PUT';
      dynamic response = await _apiService.getAuthPostApiMultipartResponse(
        url,
        {
          'close_note': note,
        },
        files,
      );
      print('complete snag response');
      log(response.toString());
      return CompleteSnagResponseModel.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<CompleteSnagResponseModel?> cancelSnag({
    required int id,
    required String note,
    required List<http.MultipartFile> files,
  }) async {
    try {
      String url = '${ApiUrl.snags}/$id/cancel?_method=PUT';
      dynamic response = await _apiService.getAuthPostApiMultipartResponse(
        url,
        {
          'close_note': note,
        },
        files,
      );
      print('cancel snag response');
      log(response.toString());
      return CompleteSnagResponseModel.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }
}
