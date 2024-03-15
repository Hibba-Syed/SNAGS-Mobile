import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:iskaan_inspections_mobile/model/user_activity/user_activity_response_model.dart';
import 'package:iskaan_inspections_mobile/repo/profile/profile_repo.dart';
import 'package:iskaan_inspections_mobile/repo/profile/profile_repo_impl.dart';

part 'activities_state.dart';

class ActivitiesCubit extends Cubit<ActivitiesState> {
  ActivitiesCubit() : super(const ActivitiesState());

  final ProfileRepo _profileRepo = ProfileRepoImpl();

  Future<void> getActivities() async {
    emit(state.copyWith(isLoading: true, page: 1));
    UserActivityResponseModel? response =
        await _profileRepo.getUserActivities(page: state.page).onError(
      (error, stackTrace) {
        emit(state.copyWith(isLoading: false));
        Fluttertoast.showToast(
          msg: error.toString(),
        );
        throw error!;
      },
    );
    if (response != null) {
      emit(state.copyWith(
          isLoading: false, userActivities: response.record ?? []));
    } else {
      emit(state.copyWith(isLoading: false, userActivities: []));
      Fluttertoast.showToast(msg: 'Error while fetching activities');
    }
  }

  Future<void> getMoreActivities() async {
    int page = state.page + 1;
    emit(state.copyWith(loadMore: true, isLoading: false, page: page));
    UserActivityResponseModel? response = await _profileRepo
        .getUserActivities(
      page: state.page,
    )
        .onError(
      (error, stackTrace) {
        emit(state.copyWith(loadMore: false));
        Fluttertoast.showToast(
          msg: error.toString(),
        );
        throw error!;
      },
    );
    emit(state.copyWith(loadMore: false));
    if (response != null) {
      if (response.record?.isNotEmpty ?? false) {
        List<UserActivityModel> activities = state.userActivities ?? [];
        activities.addAll(response.record as Iterable<UserActivityModel>);
        emit(state.copyWith(userActivities: activities));
      } else {
        Fluttertoast.showToast(msg: 'No more activities');
        page = state.page - 1;
        emit(state.copyWith(page: page));
      }
    } else {
      Fluttertoast.showToast(
          msg: 'Something went wrong while fetching activities');
    }
  }
}
