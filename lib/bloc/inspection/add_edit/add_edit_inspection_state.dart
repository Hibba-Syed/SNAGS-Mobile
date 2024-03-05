part of 'add_edit_inspection_cubit.dart';

class AddEditInspectionState {
  final bool isLoading;
  final bool loadMore;
  final List<Inspector>? inspectors;
  final InspectionTemplateRecord? inspectionTemplateRecord;
  final InspectionDetails? inspectionDetails;
  final int? communityId;
  const AddEditInspectionState({
    this.isLoading = false,
    this.loadMore = false,
    this.inspectors,
    this.inspectionTemplateRecord,
    this.inspectionDetails,
    this.communityId,
  });
  AddEditInspectionState copyWith({
    bool? isLoading,
    bool? loadMore,
    List<Inspector>? inspectors,
    InspectionTemplateRecord? inspectionTemplateRecord,
    InspectionDetails? inspectionDetails,
    int? communityId,
  }) {
    return AddEditInspectionState(
      isLoading: isLoading ?? this.isLoading,
      loadMore: loadMore ?? this.loadMore,
      inspectors: inspectors ?? this.inspectors,
      inspectionTemplateRecord:
          inspectionTemplateRecord ?? this.inspectionTemplateRecord,
      inspectionDetails: inspectionDetails??this.inspectionDetails,
      communityId: communityId??this.communityId,
    );
  }
}
