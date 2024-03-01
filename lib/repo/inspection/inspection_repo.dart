import 'package:iskaan_inspections_mobile/model/inspection/inspection_details_response_model.dart';
import 'package:iskaan_inspections_mobile/model/inspection/inspection_template_response_model.dart';
import 'package:iskaan_inspections_mobile/model/inspection/inspections_response_model.dart';
import 'package:iskaan_inspections_mobile/model/inspection/inspections_statistics_by_month_response_model.dart';
import 'package:iskaan_inspections_mobile/model/inspection/inspections_statistics_response_model.dart';
import 'package:iskaan_inspections_mobile/model/inspection/inspectors_response_model.dart';

abstract class InspectionRepo {
  Future<InspectionsStatisticsResponseModel?> getInspectionsStatistics(
      {int? months});
  Future<InspectionsStatisticsByMonthResponseModel?> getInspectionsStatisticsByMonth();
  Future<InspectionsResponseModel?> getInspections({
    int? page,
    int? limit,
    List<int>? associationIds,
    List<int>? companyIds,
    List<String>? statuses,
    String? fromDate,
    String? toDate,
  });

  Future<InspectionDetailsResponseModel?> getInspectionDetails({required int id});
  Future<InspectionTemplateResponseModel?> getInspectionTemplate({required int id});
  Future<InspectorsResponseModel?> getInspectors({required int id});
  Future<void> addInspection({dynamic data});
}
