import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:iskaan_inspections_mobile/bloc/communities/detail/community_detail_inspections/community_detail_inspections_cubit.dart';
import 'package:iskaan_inspections_mobile/bloc/dashboard/dashboard_cubit.dart';
import 'package:iskaan_inspections_mobile/bloc/inspection/inspection_cubit.dart';
import 'package:iskaan_inspections_mobile/model/inspection/inspection_details_response_model.dart';
import 'package:iskaan_inspections_mobile/model/inspection/submit_inspection_response_model.dart';
import 'package:iskaan_inspections_mobile/repo/inspection/inspection_repo.dart';
import 'package:iskaan_inspections_mobile/repo/inspection/inspection_repo_impl.dart';

part 'inspection_details_state.dart';

class InspectionDetailsCubit extends Cubit<InspectionDetailsState> {
  InspectionDetailsCubit() : super(const InspectionDetailsState());

  final InspectionRepo _inspectionRepo = InspectionRepoImpl();

  onChangeReference(String? reference) {
    emit(state.copyWith(reference: reference));
  }

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

  Future<void> submitInspection(BuildContext context,{required int id}) async {
    emit(state.copyWith(isSubmitLoading: true));
    SubmitInspectionResponseModel? response =
        await _inspectionRepo.submitInspection(id: id).onError(
      (error, stackTrace) {
        emit(state.copyWith(isSubmitLoading: false));
        Fluttertoast.showToast(
          msg: error.toString(),
        );
        throw error!;
      },
    );
    emit(state.copyWith(isSubmitLoading: false));
    if (response != null) {
      Fluttertoast.showToast(msg: 'Inspection submitted successfully');
      emit(state.copyWith(inspectionDetails: response.record));
      context.read<DashboardCubit>().getRecentInspections();
      context.read<CommunityDetailInspectionsCubit>().getCommunityInspections();
      context.read<InspectionCubit>().getInspections();
    } else {
      Fluttertoast.showToast(
          msg: 'Something went wrong while submitting inspection');
    }
  }

  Future<void> archiveInspection(BuildContext context,{required int id}) async {
    emit(state.copyWith(isArchiveLoading: true));
    bool? response = await _inspectionRepo.archiveInspection(id: id).onError(
      (error, stackTrace) {
        emit(state.copyWith(isArchiveLoading: false));
        Fluttertoast.showToast(
          msg: error.toString(),
        );
        throw error!;
      },
    );
    emit(state.copyWith(isArchiveLoading: false));
    if (response == true) {
      Fluttertoast.showToast(msg: 'Inspection archived successfully');
      Navigator.pop(context,true);
    } else {
      Fluttertoast.showToast(
          msg: 'Something went wrong while archiving inspection');
    }
  }
}
