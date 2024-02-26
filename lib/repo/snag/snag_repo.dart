import 'package:iskaan_inspections_mobile/model/snag/snags_response_model.dart';
import 'package:iskaan_inspections_mobile/model/snag/snags_statistics_response_model.dart';

abstract class SnagRepo{
  Future<SnagsStatisticsResponseModel?> getSnagsStatistics({String? filter});
  Future<SnagsResponseModel?> getSnags({String? filter});
}