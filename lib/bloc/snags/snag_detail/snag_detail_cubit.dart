import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:iskaan_inspections_mobile/model/snag/complete_snag_response_model.dart';
import 'package:iskaan_inspections_mobile/model/snag/merge_snag_response_model.dart';
import 'package:iskaan_inspections_mobile/model/snag/snag_details_response_model.dart';
import 'package:iskaan_inspections_mobile/model/snag/snag_model.dart';
import 'package:iskaan_inspections_mobile/model/snag/snags_response_model.dart';
import 'package:iskaan_inspections_mobile/model/snag/start_snag_response_model.dart';
import 'package:iskaan_inspections_mobile/repo/snag/snag_repo.dart';
import 'package:iskaan_inspections_mobile/repo/snag/snag_repo_impl.dart';
import 'package:http/http.dart' as http;

part 'snag_detail_state.dart';

class SnagDetailCubit extends Cubit<SnagDetailState> {
  SnagDetailCubit() : super(const SnagDetailState());
  final SnagRepo _snagRepo = SnagRepoImpl();

  onChangeCarouselIndex(int index) {
    emit(state.copyWith(carouselIndex: index));
  }

  onChangeReference(String? reference) {
    emit(state.copyWith(reference: reference));
  }

  onChangeSnagsToMerge(List<SnagModel> snags) {
    emit(state.copyWith(snagsToMerge: snags));
  }

  onChangeSelectedSnagsToMerge(List<SnagModel> snags) {
    emit(state.copyWith(selectedSnagsToMerge: snags));
  }

  addItemIntoSelectedSnag(SnagModel snag) {
    List<SnagModel> selectedSnags = state.selectedSnagsToMerge ?? [];
    List<SnagModel> snagsToMerge = state.snagsToMerge ?? [];
    snagsToMerge.remove(snag);
    selectedSnags.add(snag);
    emit(state.copyWith(
        selectedSnagsToMerge: selectedSnags, snagsToMerge: snagsToMerge));
  }

  removeItemFromSelectedSnags(SnagModel snag) {
    List<SnagModel> selectedSnags = state.selectedSnagsToMerge ?? [];
    List<SnagModel> snagsToMerge = state.snagsToMerge ?? [];
    selectedSnags.remove(snag);
    snagsToMerge.add(snag);
    emit(state.copyWith(
        selectedSnagsToMerge: selectedSnags, snagsToMerge: snagsToMerge));
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
      log(response.record!.toJson().toString());
      emit(state.copyWith(snagDetails: response.record));
    } else {
      Fluttertoast.showToast(
          msg: 'Something went wrong while fetching snag details');
    }
  }

  Future<void> getSnags({
    required String keyword,
    required int communityId,
  }) async {
    emit(state.copyWith(
      isSnagsToMergeLoading: true,
    ));
    SnagsResponseModel? response = await _snagRepo.getSnags(
      page: 1,
      keyword: keyword,
      associationIds: [communityId],
    ).onError(
      (error, stackTrace) {
        emit(state.copyWith(isSnagsToMergeLoading: false));
        Fluttertoast.showToast(
          msg: error.toString(),
        );
        throw error!;
      },
    );
    emit(state.copyWith(isSnagsToMergeLoading: false));
    if (response != null) {
      emit(state.copyWith(snagsToMerge: response.record));
    } else {
      Fluttertoast.showToast(msg: 'Something went wrong while fetching snags');
    }
  }

  Future<void> mergeSnags(
    BuildContext context, {
    required int? snagId,
    required List<int> snagsToMergeIds,
    required String note,
  }) async {
    emit(state.copyWith(
      isMergeLoading: true,
    ));
    MergeSnagResponseModel? response = await _snagRepo
        .mergeSnags(
      snagId: snagId,
      snagsToMergeIds: snagsToMergeIds,
      note: note,
    )
        .onError(
      (error, stackTrace) {
        emit(state.copyWith(isMergeLoading: false));
        Fluttertoast.showToast(
          msg: error.toString(),
        );
        throw error!;
      },
    );
    emit(state.copyWith(isMergeLoading: false));
    if (response?.status == 'success') {
      Navigator.pop(context, true);
    } else {
      Fluttertoast.showToast(msg: 'Something went wrong while merging snags');
    }
  }

  Future<void> startSnag(
    BuildContext context,
  ) async {
    if (state.snagDetails?.id != null) {
      emit(state.copyWith(
        isStartLoading: true,
      ));
      StartSnagResponseModel? response = await _snagRepo
          .startSnag(
        id: state.snagDetails!.id!,
      )
          .onError(
        (error, stackTrace) {
          emit(state.copyWith(isStartLoading: false));
          Fluttertoast.showToast(
            msg: error.toString(),
          );
          throw error!;
        },
      );
      emit(state.copyWith(isStartLoading: false));
      if (response?.status == 'success') {
        Fluttertoast.showToast(msg: 'Snag started successfully');
        if (state.snagDetails?.id != null) {
          getSnagDetails(id: state.snagDetails!.id!);
        }
      } else {
        Fluttertoast.showToast(
            msg: 'Something went wrong while starting this snag');
      }
    }
  }

  Future<void> completeSnag(
    BuildContext context, {
    required String note,
    required List<String> filesPaths,
  }) async {
    emit(state.copyWith(
      isCompleteLoading: true,
    ));
    try {
      List<http.MultipartFile> multipartFiles = [];
      for (int i = 0; i < filesPaths.length; i++) {
        if (filesPaths[i].isNotEmpty) {
          multipartFiles.add(await http.MultipartFile.fromPath(
              'close_images[$i]', filesPaths[i]));
        }
      }
      CompleteSnagResponseModel? response = await _snagRepo
          .completeSnag(
        id: state.snagDetails!.id!,
        note: note,
        files: multipartFiles,
      )
          .onError(
        (error, stackTrace) {
          emit(state.copyWith(isCompleteLoading: false));
          Fluttertoast.showToast(
            msg: error.toString(),
          );
          throw error!;
        },
      );
      emit(state.copyWith(isCompleteLoading: false));
      if (response != null) {
        Fluttertoast.showToast(msg: 'Snag completed successfully');

        getSnagDetails(id: state.snagDetails!.id!);
      } else {
        Fluttertoast.showToast(
            msg: 'Something went wrong while completing snag');
      }
    } catch (e) {
      emit(state.copyWith(isLoading: false));
      Fluttertoast.showToast(msg: e.toString());
      rethrow;
    }
  }

  Future<void> cancelSnag(
    BuildContext context, {
    required String note,
    required List<String> filesPaths,
  }) async {
    emit(state.copyWith(
      isCancelLoading: true,
    ));
    try {
      List<http.MultipartFile> multipartFiles = [];
      for (int i = 0; i < filesPaths.length; i++) {
        if (filesPaths[i].isNotEmpty) {
          multipartFiles.add(await http.MultipartFile.fromPath(
              'close_images[$i]', filesPaths[i]));
        }
      }
      CompleteSnagResponseModel? response = await _snagRepo
          .cancelSnag(
        id: state.snagDetails!.id!,
        note: note,
        files: multipartFiles,
      )
          .onError(
        (error, stackTrace) {
          emit(state.copyWith(isCancelLoading: false));
          Fluttertoast.showToast(
            msg: error.toString(),
          );
          throw error!;
        },
      );
      emit(state.copyWith(isCancelLoading: false));
      if (response != null) {
        Fluttertoast.showToast(msg: 'Snag cancelled successfully');
        getSnagDetails(id: state.snagDetails!.id!);
      } else {
        Fluttertoast.showToast(
            msg: 'Something went wrong while completing snag');
      }
    } catch (e) {
      emit(state.copyWith(isLoading: false));
      Fluttertoast.showToast(msg: e.toString());
      rethrow;
    }
  }
}
