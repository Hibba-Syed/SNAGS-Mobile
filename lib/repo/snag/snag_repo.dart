import 'package:iskaan_inspections_mobile/model/snag/add_edit_snag_response_model.dart';
import 'package:iskaan_inspections_mobile/model/snag/merge_snag_response_model.dart';
import 'package:iskaan_inspections_mobile/model/snag/snag_details_response_model.dart';
import 'package:iskaan_inspections_mobile/model/snag/snags_response_model.dart';
import 'package:iskaan_inspections_mobile/model/snag/snags_statistics_by_month_response_model.dart';
import 'package:iskaan_inspections_mobile/model/snag/snags_statistics_response_model.dart';
import 'package:http/http.dart' as http;

abstract class SnagRepo {
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
    String? keyword,
  });
  Future<SnagDetailsResponseModel?> getSnagDetails({required int id});

  Future<AddEditSnagResponseModel?> addSnag({
    required Map<String, dynamic> data,
    required List<http.MultipartFile> files,
  });
  Future<AddEditSnagResponseModel?> updateSnag({
    required int id,
    required Map<String, dynamic> data,
    required List<http.MultipartFile> files,
  });
  Future<MergeSnagResponseModel?> mergeSnags({
    required int? snagId,
    required List<int> snagsToMergeIds,
    required String note,
  });
}
