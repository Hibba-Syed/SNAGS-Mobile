import 'package:iskaan_inspections_mobile/model/profile/profile_response_model.dart';

abstract class ProfileRepo{
  Future<ProfileResponseModel?> getProfile();

}