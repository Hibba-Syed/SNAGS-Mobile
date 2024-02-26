import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:iskaan_inspections_mobile/model/inspection/inspections_response_model.dart';
import 'package:iskaan_inspections_mobile/model/inspection/inspections_statistics_response_model.dart';
import 'package:iskaan_inspections_mobile/model/profile/profile_response_model.dart';
import 'package:iskaan_inspections_mobile/model/snag/snags_response_model.dart';
import 'package:iskaan_inspections_mobile/model/snag/snags_statistics_response_model.dart';
import 'package:iskaan_inspections_mobile/repo/inspection/inspection_repo.dart';
import 'package:iskaan_inspections_mobile/repo/inspection/inspection_repo_impl.dart';
import 'package:iskaan_inspections_mobile/repo/profile/profile_repo.dart';
import 'package:iskaan_inspections_mobile/repo/profile/profile_repo_impl.dart';
import 'package:iskaan_inspections_mobile/repo/snag/snag_repo.dart';
import 'package:iskaan_inspections_mobile/repo/snag/snag_repo_impl.dart';
import 'package:iskaan_inspections_mobile/utils/preference_utils.dart';

part 'dashboard_state.dart';

class DashboardCubit extends Cubit<DashboardState> {
  DashboardCubit() : super(const DashboardState());

  final ProfileRepo _profileRepo = ProfileRepoImpl();
  final InspectionRepo _inspectionRepo = InspectionRepoImpl();
  final SnagRepo _snagRepo = SnagRepoImpl();

  onChangeIsFloatingButtonExpanded(bool? value) {
    emit(state.copyWith(isFloatingButtonExpanded: value));
  }

  Future<void> getProfile() async {
    ProfileResponseModel? profileResponse =
        await _profileRepo.getProfile().onError(
      (error, stackTrace) {
        Fluttertoast.showToast(
          msg: error.toString(),
        );
        throw error!;
      },
    );
    if (profileResponse != null) {
      spUtil.profileRecord = profileResponse.record;
      emit(state.copyWith(profileRecord: profileResponse.record));
    } else {
      Fluttertoast.showToast(
          msg: 'Something went wrong while fetching profile');
    }
  }

  Future<void> getInspectionsStatistics() async {
    InspectionsStatisticsResponseModel? statisticsResponse =
        await _inspectionRepo.getInspectionsStatistics().onError(
      (error, stackTrace) {
        Fluttertoast.showToast(
          msg: error.toString(),
        );
        throw error!;
      },
    );
    if (statisticsResponse != null) {
      emit(state.copyWith(inspectionsStatistics: statisticsResponse.record));
    } else {
      Fluttertoast.showToast(msg: 'Something went wrong');
    }
  }

  Future<void> getSnagsStatistics() async {
    SnagsStatisticsResponseModel? statisticsResponse =
        await _snagRepo.getSnagsStatistics().onError(
      (error, stackTrace) {
        Fluttertoast.showToast(
          msg: error.toString(),
        );
        throw error!;
      },
    );
    if (statisticsResponse != null) {
      emit(state.copyWith(snagsStatistics: statisticsResponse.record));
    } else {
      Fluttertoast.showToast(msg: 'Something went wrong');
    }
  }

  Future<void> getRecentInspections() async {
    InspectionsResponseModel? response =
        await _inspectionRepo.getInspections().onError(
      (error, stackTrace) {
        Fluttertoast.showToast(
          msg: error.toString(),
        );
        throw error!;
      },
    );
    if (response != null) {
      emit(state.copyWith(recentInspections: response.record));
    } else {
      Fluttertoast.showToast(
          msg: 'Something went wrong while fetching inspections');
    }
  }

  Future<void> getRecentSnags() async {
    SnagsResponseModel? response = await _snagRepo.getSnags().onError(
      (error, stackTrace) {
        Fluttertoast.showToast(
          msg: error.toString(),
        );
        throw error!;
      },
    );
    if (response != null) {
      emit(state.copyWith(recentSnags: response.record));
    } else {
      Fluttertoast.showToast(msg: 'Something went wrong while fetching snags');
    }
  }

  Future<void> fetchData() async {
    emit(state.copyWith(isLoading: true));
    await Future.wait([
      getProfile(),
      getInspectionsStatistics(),
      getSnagsStatistics(),
      getRecentInspections(),
      getRecentSnags(),
    ]).onError((error, stackTrace) {
      emit(state.copyWith(isLoading: false));
      throw error!;
    });
    emit(state.copyWith(isLoading: false));
  }
}
