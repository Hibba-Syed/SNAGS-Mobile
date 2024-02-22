import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:iskaan_inspections_mobile/model/profile/profile_response_model.dart';
import 'package:iskaan_inspections_mobile/repo/profile/profile_repo.dart';
import 'package:iskaan_inspections_mobile/repo/profile/profile_repo_impl.dart';
import 'package:iskaan_inspections_mobile/utils/preference_utils.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(const ProfileState());
  final ProfileRepo _profileRepo = ProfileRepoImpl();

  Future<void> getProfile() async {
    emit(state.copyWith(isLoading: true));
    ProfileResponseModel? profileResponse =
        await _profileRepo.getProfile().onError(
      (error, stackTrace) {
        emit(state.copyWith(isLoading: false));
        Fluttertoast.showToast(
          msg: error.toString(),
        );
        throw error!;
      },
    );
    emit(state.copyWith(isLoading: false));
    if (profileResponse != null) {
      spUtil.profileRecord = profileResponse.record;
      emit(state.copyWith(profileRecord: profileResponse.record));
    } else {
      Fluttertoast.showToast(msg: 'Something went wrong');
    }
  }
}
