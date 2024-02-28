import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:iskaan_inspections_mobile/model/snag/snags_response_model.dart';
import 'package:iskaan_inspections_mobile/repo/snag/snag_repo.dart';
import 'package:iskaan_inspections_mobile/repo/snag/snag_repo_impl.dart';

part 'snags_state.dart';

class SnagsCubit extends Cubit<SnagsState> {
  SnagsCubit() : super(const SnagsState());

  final SnagRepo _snagRepo = SnagRepoImpl();

  onChangeSelectedStatuses( List<String>? status){
    emit(state.copyWith(selectedCStatuses: status));
  }

  Future<void> getSnags() async {
    emit(state.copyWith(isLoading: true, page: 1));
    SnagsResponseModel? response = await _snagRepo
        .getSnags(
      page: state.page,
    )
        .onError(
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

  Future<void> getMoreSnags() async {
    int page = state.page + 1;
    emit(state.copyWith(loadMore: true, isLoading: false, page: page));
    SnagsResponseModel? response = await _snagRepo
        .getSnags(
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
}
