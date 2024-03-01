import 'package:iskaan_inspections_mobile/data/network/base_api_services.dart';
import 'package:iskaan_inspections_mobile/data/network/network_api_services.dart';
import 'package:iskaan_inspections_mobile/model/inspection/inspection_details_response_model.dart';
import 'package:iskaan_inspections_mobile/model/inspection/inspection_template_response_model.dart';
import 'package:iskaan_inspections_mobile/model/inspection/inspections_response_model.dart';
import 'package:iskaan_inspections_mobile/model/inspection/inspections_statistics_by_month_response_model.dart';
import 'package:iskaan_inspections_mobile/model/inspection/inspections_statistics_response_model.dart';
import 'package:iskaan_inspections_mobile/model/inspection/inspectors_response_model.dart';
import 'package:iskaan_inspections_mobile/repo/inspection/inspection_repo.dart';
import 'package:iskaan_inspections_mobile/res/constants/api_url.dart';

class InspectionRepoImpl implements InspectionRepo {
  final BaseApiServices _apiService = NetworkApiServices();
  @override
  Future<InspectionsStatisticsResponseModel?> getInspectionsStatistics(
      {int? months}) async {
    try {
      String url = '${ApiUrl.inspectionsStatistics}?months=${months ?? ''}';
      dynamic response = await _apiService.getAuthGetApiResponse(url);
      return InspectionsStatisticsResponseModel.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<InspectionsResponseModel?> getInspections({
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
          '${ApiUrl.inspections}?page=${page ?? 1}&limit=${limit ?? 10}&association_ids=${associationIdsString ?? ''}&company_ids=${companyIdsString ?? ''}&status=${statusesString ?? ''}&from_date=${fromDate ?? ''}&to_date=${toDate ?? ''}&order_by=association_name&order_dir=desc';
      dynamic response = await _apiService.getAuthGetApiResponse(url);
      return InspectionsResponseModel.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<InspectionDetailsResponseModel?> getInspectionDetails(
      {required int id}) async {
    try {
      String url = '${ApiUrl.inspections}/$id';
      dynamic response = await _apiService.getAuthGetApiResponse(url);
      return InspectionDetailsResponseModel.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<InspectionsStatisticsByMonthResponseModel?>
      getInspectionsStatisticsByMonth() async {
    try {
      String url = '${ApiUrl.inspectionsStatisticsByMonth}?months=12';
      dynamic response = await _apiService.getAuthGetApiResponse(url);
      return InspectionsStatisticsByMonthResponseModel.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<InspectionTemplateResponseModel?> getInspectionTemplate({required int id}) async{
    try {
      String url = '${ApiUrl.inspectionTemplate}/$id/template';
      dynamic response = await _apiService.getAuthGetApiResponse(url);
      return InspectionTemplateResponseModel.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<InspectorsResponseModel?> getInspectors({required int id}) async{
    try {
      String url = '${ApiUrl.inspectors}/$id/inspectors';
      dynamic response = await _apiService.getAuthGetApiResponse(url);
      return InspectorsResponseModel.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> addInspection({dynamic data}) async{
    try {
      String url = ApiUrl.inspections;
      dynamic response = await _apiService.getAuthPostApiResponse(url,data);
      // return InspectorsResponseModel.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }


}
