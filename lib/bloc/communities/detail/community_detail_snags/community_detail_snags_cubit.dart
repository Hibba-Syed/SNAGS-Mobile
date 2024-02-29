import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:iskaan_inspections_mobile/model/association/association_model.dart';
import 'package:iskaan_inspections_mobile/model/snag/snag_model.dart';
import 'package:iskaan_inspections_mobile/model/snag/snags_response_model.dart';
import 'package:iskaan_inspections_mobile/repo/snag/snag_repo.dart';
import 'package:iskaan_inspections_mobile/repo/snag/snag_repo_impl.dart';

part 'community_detail_snags_state.dart';

class CommunityDetailSnagsCubit extends Cubit<CommunityDetailSnagsState> {
  CommunityDetailSnagsCubit() : super(const CommunityDetailSnagsState());
  final SnagRepo _snagRepo = SnagRepoImpl();

  Future<void> getCommunitySnags() async {
    emit(state.copyWith(isLoading: true));
    SnagsResponseModel? response = await _snagRepo.getSnags(
      associationIds: [state.community!.id!],
    ).onError(
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
      emit(state.copyWith(snags: response.record));
    } else {
      Fluttertoast.showToast(msg: 'Something went wrong while fetching snags');
    }
  }

  Future<void> getMoreCommunitySnags() async {
    int page = state.page + 1;
    emit(state.copyWith(loadMore: true, isLoading: false, page: page));
    SnagsResponseModel? response = await _snagRepo.getSnags(
      associationIds: [state.community!.id!],
      page: state.page,
    ).onError(
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
        List<SnagModel> snags = state.snags ?? [];
        snags.addAll(response.record as Iterable<SnagModel>);
        emit(state.copyWith(snags: snags));
      } else {
        Fluttertoast.showToast(msg: 'No more snags');
        page = state.page - 1;
        emit(state.copyWith(page: page));
      }
    } else {
      Fluttertoast.showToast(msg: 'Something went wrong while fetching snags');
    }
  }

  onChangeCommunity(Association? community) {
    emit(state.copyWith(community: community));
  }
}
