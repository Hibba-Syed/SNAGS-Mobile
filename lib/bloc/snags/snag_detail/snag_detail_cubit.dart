import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:iskaan_inspections_mobile/model/snag/snag_details_response_model.dart';
import 'package:iskaan_inspections_mobile/repo/snag/snag_repo.dart';
import 'package:iskaan_inspections_mobile/repo/snag/snag_repo_impl.dart';

part 'snag_detail_state.dart';

class SnagDetailCubit extends Cubit<SnagDetailState> {
  SnagDetailCubit() : super(const SnagDetailState());
  final SnagRepo _snagRepo = SnagRepoImpl();

  onChangeCarouselIndex(int index) {
    emit(state.copyWith(carouselIndex: index));
  }
  onChangeReference(String? reference){
    emit(state.copyWith(reference: reference));
  }

  Future<void> getSnagDetails({required int id}) async {
    emit(state.copyWith(isLoading: true));
    SnagDetailsResponseModel? response =
        await _snagRepo.getSnagDetails(id: id).onError(
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
      emit(state.copyWith(snagDetails: response.record));
    } else {
      Fluttertoast.showToast(
          msg: 'Something went wrong while fetching snag details');
    }
  }
}
