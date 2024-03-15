import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:iskaan_inspections_mobile/bloc/communities/detail/community_detail_inspections/community_detail_inspections_cubit.dart';
import 'package:iskaan_inspections_mobile/bloc/dashboard/dashboard_cubit.dart';
import 'package:iskaan_inspections_mobile/bloc/inspection/detail/inspection_details_cubit.dart';
import 'package:iskaan_inspections_mobile/bloc/inspection/inspection_cubit.dart';
import 'package:iskaan_inspections_mobile/model/inspection/add_edit_inspection_response_model.dart';
import 'package:iskaan_inspections_mobile/model/inspection/inspection_details_response_model.dart';
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

  Future<void> getInspectionTemplate() async {
    emit(state.copyWith(isLoading: true));
    InspectionTemplateResponseModel? response = await _inspectionRepo
        .getInspectionTemplate(
      id: state.communityId!,
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
    if (response != null) {
      emit(state.copyWith(
        isLoading: false,
          inspectionTemplateRecord:
              response.record ?? InspectionTemplateRecord()));
    } else {
      Fluttertoast.showToast(
          msg: 'Something went wrong while fetching template');
    }
  }

  Future<void> addInspection(BuildContext context, {dynamic data}) async {
    emit(state.copyWith(isLoading: true));
    final AddEditInspectionResponseModel? response = await _inspectionRepo
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
    if (response != null) {
      Navigator.pop(context, true);
      Fluttertoast.showToast(msg: 'Inspection added successfully');
      // emit(state.copyWith(inspectionTemplateRecord: response.record??InspectionTemplateRecord()));
    } else {
      Fluttertoast.showToast(
          msg: 'Something went wrong while adding inspections');
    }
  }

  Future<void> updateInspection(
    BuildContext context, {
    required int inspectionId,
    required dynamic data,
  }) async {
    emit(state.copyWith(isLoading: true));
    final AddEditInspectionResponseModel? response = await _inspectionRepo
        .updateInspection(
      id: inspectionId,
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
    if (response != null) {
      onChangeInspectionDetails(response.record);
      Fluttertoast.showToast(msg: 'Inspection updated successfully');
      context
          .read<InspectionDetailsCubit>()
          .getInspectionDetails(id: inspectionId);
      context.read<DashboardCubit>().getRecentInspections();
      context.read<CommunityDetailInspectionsCubit>().getCommunityInspections();
      context.read<InspectionCubit>().getInspections();

      // emit(state.copyWith(inspectionTemplateRecord: response.record??InspectionTemplateRecord()));
    } else {
      Fluttertoast.showToast(
          msg: 'Something went wrong while updating inspections');
    }
  }
  onChangeCommunityId(int? id){
    emit(state.copyWith(communityId: id));
  }
  onChangeInspectionDetails(InspectionDetails? details){
    emit(state.copyWith(inspectionDetails: details));
  }
}
