import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:iskaan_inspections_mobile/model/inspection/inspection_details_response_model.dart';
import 'package:iskaan_inspections_mobile/repo/inspection/inspection_repo.dart';
import 'package:iskaan_inspections_mobile/repo/inspection/inspection_repo_impl.dart';

part 'inspection_details_state.dart';

class InspectionDetailsCubit extends Cubit<InspectionDetailsState> {
  InspectionDetailsCubit() : super(const InspectionDetailsState());

  final InspectionRepo _inspectionRepo = InspectionRepoImpl();

  Future<void> getInspectionDetails({required int id}) async {
    emit(state.copyWith(isLoading: true));
    InspectionDetailsResponseModel? response =
        await _inspectionRepo.getInspectionDetails(id: id).onError(
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
      emit(state.copyWith(inspectionDetails: response.record));
    } else {
      Fluttertoast.showToast(
          msg: 'Something went wrong while fetching inspection details');
    }
  }
}
