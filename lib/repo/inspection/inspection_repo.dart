

import 'package:iskaan_inspections_mobile/model/inspection/inspections_response_model.dart';
import 'package:iskaan_inspections_mobile/model/inspection/inspections_statistics_response_model.dart';

abstract class InspectionRepo{
  Future<InspectionsStatisticsResponseModel?> getInspectionsStatistics({String? filter});
  Future<InspectionsResponseModel?> getInspections({String? filter});
}