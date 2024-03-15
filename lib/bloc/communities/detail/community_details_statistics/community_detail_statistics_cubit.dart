import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:iskaan_inspections_mobile/model/inspection/inspections_statistics_response_model.dart';
import 'package:iskaan_inspections_mobile/model/snag/snags_statistics_response_model.dart';
import 'package:iskaan_inspections_mobile/repo/association/association_repo.dart';
import 'package:iskaan_inspections_mobile/repo/association/association_repo_impl.dart';

part 'community_detail_statistics_state.dart';

class CommunityDetailStatisticsCubit
    extends Cubit<CommunityDetailStatisticsState> {
  CommunityDetailStatisticsCubit()
      : super(const CommunityDetailStatisticsState());
  final AssociationRepo _associationRepo = AssociationRepoImpl();

  Future<void> getCommunitySnagsStatistics({required String? month}) async {
    emit(state.copyWith(isLoading: true));
    SnagsStatisticsResponseModel? response =
        await _associationRepo.getCommunitySnagsStatistics().onError(
      (error, stackTrace) {
        emit(state.copyWith(isLoading: false));
        Fluttertoast.showToast(
          msg: error.toString(),
        );
        throw error!;
      },
    );
    emit(state.copyWith(isLoading: false));
    if (response != null) {
      emit(state.copyWith(snagsStatistics: response.record));
    } else {
      Fluttertoast.showToast(
          msg: 'Something went wrong while fetching communities');
    }
  }

  Future<void> getCommunityInspectionsStatistics() async {
    emit(state.copyWith(isLoading: true));
    InspectionsStatisticsResponseModel? response =
        await _associationRepo.getCommunityInspectionsStatistics().onError(
      (error, stackTrace) {
        emit(state.copyWith(isLoading: false));
        Fluttertoast.showToast(
          msg: error.toString(),
        );
        throw error!;
      },
    );
    emit(state.copyWith(isLoading: false));
    if (response != null) {
      emit(state.copyWith(inspectionsStatistics: response.record));
    } else {
      Fluttertoast.showToast(
          msg: 'Something went wrong while fetching communities');
    }
  }

  onChangeId(int? id){
    emit(state.copyWith(communityId: id));
  }
}
