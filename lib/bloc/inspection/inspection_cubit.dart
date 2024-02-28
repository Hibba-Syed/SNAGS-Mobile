import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:iskaan_inspections_mobile/model/association/association_model.dart';
import 'package:iskaan_inspections_mobile/model/company_model.dart';
import 'package:iskaan_inspections_mobile/model/inspection/inspections_response_model.dart';
import 'package:iskaan_inspections_mobile/repo/inspection/inspection_repo.dart';
import 'package:iskaan_inspections_mobile/repo/inspection/inspection_repo_impl.dart';

part 'inspection_state.dart';

class InspectionCubit extends Cubit<InspectionState> {
  InspectionCubit() : super(const InspectionState());

  final InspectionRepo _inspectionRepo = InspectionRepoImpl();
  onChangeSelectedCommunities(List<Association>? communities) {
    emit(state.copyWith(selectedCommunities: communities));
  }

  onChangeSelectedStatuses(List<String>? status) {
    emit(state.copyWith(selectedStatuses: status));
  }

  onChangeFromDate(String? fromDate) {
    emit(state.copyWith(fromDate: fromDate));
  }

  onChangeToDate(String? toDate) {
    emit(state.copyWith(toDate: toDate));
  }

  onChangeSelectedCompanies(List<Company>? companies) {
    emit(state.copyWith(selectedCompanies: companies));
  }

  clearFilterData() {
    emit(
      state.copyWith(
        selectedCommunities: [],
        selectedStatuses: [],
        fromDate: '',
        toDate: '',
        selectedCompanies: [],
      ),
    );
  }

  Future<void> getInspections() async {
    emit(state.copyWith(isLoading: true));
    InspectionsResponseModel? response = await _inspectionRepo
        .getInspections(
      associationIds: state.selectedCommunities?.map((e) => e.id!).toList(),
      companyIds: state.selectedCompanies?.map((e) => e.id!).toList(),
      statuses: state.selectedStatuses,
      // fromDate: state.fromDate,
      // toDate: state.toDate,
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
      emit(state.copyWith(inspections: response.record));
    } else {
      Fluttertoast.showToast(
          msg: 'Something went wrong while fetching inspections');
    }
  }

  Future<void> getMoreInspection() async {
    int page = state.page + 1;
    emit(state.copyWith(loadMore: true, isLoading: false, page: page));
    InspectionsResponseModel? response = await _inspectionRepo
        .getInspections(
      page: state.page,
      associationIds: state.selectedCommunities?.map((e) => e.id!).toList(),
      companyIds: state.selectedCompanies?.map((e) => e.id!).toList(),
      statuses: state.selectedStatuses,
      // fromDate: state.fromDate,
      // toDate: state.toDate,
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
      Fluttertoast.showToast(
          msg: 'Something went wrong while fetching inspections');
    }
  }
}
