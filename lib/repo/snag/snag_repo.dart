import 'package:iskaan_inspections_mobile/model/snag/snag_details_response_model.dart';
import 'package:iskaan_inspections_mobile/model/snag/snags_response_model.dart';
import 'package:iskaan_inspections_mobile/model/snag/snags_statistics_by_month_response_model.dart';
import 'package:iskaan_inspections_mobile/model/snag/snags_statistics_response_model.dart';

abstract class SnagRepo{
  Future<SnagsStatisticsResponseModel?> getSnagsStatistics({int? months});
  Future<SnagsStatisticsByMonthResponseModel?> getSnagsStatisticsByMonth();
  Future<SnagsResponseModel?> getSnags({
    int? page,
    int? limit,
    List<int>? associationIds,
    List<int>? companyIds,
    List<String>? statuses,
    String? fromDate,
    String? toDate,
  });
  Future<SnagDetailsResponseModel?> getSnagDetails({required int id});
}