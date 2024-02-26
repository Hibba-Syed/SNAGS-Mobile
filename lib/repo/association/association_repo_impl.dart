import 'package:iskaan_inspections_mobile/data/network/base_api_services.dart';
import 'package:iskaan_inspections_mobile/data/network/network_api_services.dart';
import 'package:iskaan_inspections_mobile/model/association/associations_response_model.dart';
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
}
