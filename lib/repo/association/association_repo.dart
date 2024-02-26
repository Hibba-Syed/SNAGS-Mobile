import 'package:iskaan_inspections_mobile/model/association/associations_response_model.dart';

abstract class AssociationRepo{
  Future<AssociationsResponseModel?> getAssociations({int? page});
}