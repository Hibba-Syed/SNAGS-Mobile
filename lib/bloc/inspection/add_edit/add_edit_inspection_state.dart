part of 'add_edit_inspection_cubit.dart';

class AddEditInspectionState {
  final bool isLoading;
  final bool loadMore;
  final List<Inspector>? inspectors;
  final InspectionTemplateRecord? inspectionTemplateRecord;
  const AddEditInspectionState({
    this.isLoading = false,
    this.loadMore = false,
    this.inspectors,
    this.inspectionTemplateRecord,
  });
  AddEditInspectionState copyWith({
    bool? isLoading,
    bool? loadMore,
    List<Inspector>? inspectors,
   InspectionTemplateRecord? inspectionTemplateRecord,

  }) {
    return AddEditInspectionState(
      isLoading: isLoading ?? this.isLoading,
      loadMore: loadMore??this.loadMore,
      inspectors: inspectors ?? this.inspectors,
      inspectionTemplateRecord: inspectionTemplateRecord??this.inspectionTemplateRecord,

    );
  }
}
