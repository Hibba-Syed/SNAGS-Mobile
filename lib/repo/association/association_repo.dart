import 'package:iskaan_inspections_mobile/model/association/associations_response_model.dart';
import 'package:iskaan_inspections_mobile/model/inspection/inspections_statistics_response_model.dart';
import 'package:iskaan_inspections_mobile/model/snag/snags_statistics_response_model.dart';

abstract class AssociationRepo {
  Future<AssociationsResponseModel?> getAssociations({int? page});
  Future<SnagsStatisticsResponseModel?> getCommunitySnagsStatistics(
      {int? months});
  Future<InspectionsStatisticsResponseModel?> getCommunityInspectionsStatistics(
      {int? months});
}
