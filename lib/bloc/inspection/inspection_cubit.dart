import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:iskaan_inspections_mobile/model/inspection/inspections_response_model.dart';
import 'package:iskaan_inspections_mobile/repo/inspection/inspection_repo.dart';
import 'package:iskaan_inspections_mobile/repo/inspection/inspection_repo_impl.dart';

part 'inspection_state.dart';

class InspectionCubit extends Cubit<InspectionState> {
  InspectionCubit() : super(const InspectionState());

  final InspectionRepo _inspectionRepo = InspectionRepoImpl();

  Future<void> getInspections() async {
    emit(state.copyWith(isLoading: true));
    InspectionsResponseModel? response =
        await _inspectionRepo.getInspections().onError(
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

  Future<void> getMoreInspection() async {
    int page = state.page + 1;
    emit(state.copyWith(loadMore: true,isLoading: false, page: page));
    InspectionsResponseModel? response = await _inspectionRepo
        .getInspections(
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
      Fluttertoast.showToast(msg: 'Something went wrong while fetching inspections');
    }
  }
}
