import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:iskaan_inspections_mobile/model/snag/snags_response_model.dart';
import 'package:iskaan_inspections_mobile/repo/snag/snag_repo.dart';
import 'package:iskaan_inspections_mobile/repo/snag/snag_repo_impl.dart';

part 'snags_state.dart';

class SnagsCubit extends Cubit<SnagsState> {
  SnagsCubit() : super(const SnagsState());

  final SnagRepo _snagRepo = SnagRepoImpl();

  Future<void> getSnags() async {
    emit(state.copyWith(isLoading: true));
    SnagsResponseModel? response = await _snagRepo.getSnags().onError(
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
}
