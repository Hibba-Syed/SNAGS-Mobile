import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:iskaan_inspections_mobile/model/inspection/inspections_response_model.dart';
import 'package:iskaan_inspections_mobile/repo/inspection/inspection_repo.dart';
import 'package:iskaan_inspections_mobile/repo/inspection/inspection_repo_impl.dart';

part 'community_detail_inspections_state.dart';

class CommunityDetailInspectionsCubit
    extends Cubit<CommunityDetailInspectionsState> {
  CommunityDetailInspectionsCubit()
      : super(const CommunityDetailInspectionsState());
  final InspectionRepo _inspectionRepo = InspectionRepoImpl();

  Future<void> getCommunityInspections() async {
    emit(state.copyWith(isLoading: true));
    InspectionsResponseModel? response =
        await _inspectionRepo.getInspections(associationIds: [state.communityId!],).onError(
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
      emit(state.copyWith(inspections: response.record));
    } else {
      Fluttertoast.showToast(
          msg: 'Something went wrong while fetching inspections');
    }
  }

  Future<void> getMoreCommunityInspections() async {
    int page = state.page + 1;
    emit(state.copyWith(loadMore: true, isLoading: false, page: page));
    InspectionsResponseModel? response = await _inspectionRepo
        .getInspections(
      associationIds: [state.communityId!],
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
        List<InspectionModel> inspections = state.inspections ?? [];
        inspections.addAll(response.record as Iterable<InspectionModel>);
        emit(state.copyWith(inspections: inspections));
      } else {
        Fluttertoast.showToast(msg: 'No more inspections');
        page = state.page - 1;
        emit(state.copyWith(page: page));
      }
    } else {
      Fluttertoast.showToast(
          msg: 'Something went wrong while fetching inspections');
    }
  }

  onChangeId(int? id){
    emit(state.copyWith(communityId: id));
  }
}
