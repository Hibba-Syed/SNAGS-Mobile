import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:iskaan_inspections_mobile/model/inspection/inspection_template_response_model.dart';
import 'package:iskaan_inspections_mobile/model/inspection/inspectors_response_model.dart';
import 'package:iskaan_inspections_mobile/model/inspector_model.dart';
import 'package:iskaan_inspections_mobile/repo/inspection/inspection_repo.dart';
import 'package:iskaan_inspections_mobile/repo/inspection/inspection_repo_impl.dart';

part 'add_edit_inspection_state.dart';

class AddEditInspectionCubit extends Cubit<AddEditInspectionState> {
  AddEditInspectionCubit() : super(const AddEditInspectionState());

  final InspectionRepo _inspectionRepo = InspectionRepoImpl();

  clearData() {
    emit(state.copyWith(
      inspectors: [],
      inspectionTemplateRecord: InspectionTemplateRecord(),
    ));
  }

  Future<void> getInspectors({required int communityId}) async {
    emit(state.copyWith(isLoading: true));
    InspectorsResponseModel? response = await _inspectionRepo
        .getInspectors(
      id: communityId,
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
      emit(state.copyWith(inspectors: response.inspectors));
    } else {
      Fluttertoast.showToast(
          msg: 'Something went wrong while fetching inspectors');
    }
  }

  Future<void> getInspectionTemplate({required int communityId}) async {
    emit(state.copyWith(isLoading: true));
    InspectionTemplateResponseModel? response = await _inspectionRepo
        .getInspectionTemplate(
      id: communityId,
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
      emit(state.copyWith(inspectionTemplateRecord: response.record??InspectionTemplateRecord()));
    } else {
      Fluttertoast.showToast(
          msg: 'Something went wrong while fetching template');
    }
  }

  Future<void> addInspection({dynamic data}) async {
    emit(state.copyWith(isLoading: true));
    final response = await _inspectionRepo
        .addInspection(
      data: data,
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
    // if (response != null) {
    //   emit(state.copyWith(inspectionTemplateRecord: response.record??InspectionTemplateRecord()));
    // } else {
    //   Fluttertoast.showToast(
    //       msg: 'Something went wrong while adding inspections');
    // }
  }

}
