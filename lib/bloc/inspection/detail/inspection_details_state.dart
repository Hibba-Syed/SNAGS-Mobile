part of 'inspection_details_cubit.dart';

class InspectionDetailsState {
  final bool isLoading;
  final InspectionDetails? inspectionDetails;
  final String? reference;
  final bool isSubmitLoading;
  final bool isArchiveLoading;
  const InspectionDetailsState({
    this.isLoading = false,
    this.inspectionDetails,
    this.reference,
    this.isSubmitLoading = false,
    this.isArchiveLoading = false,
  });
  InspectionDetailsState copyWith({
    bool? isLoading,
    InspectionDetails? inspectionDetails,
    String? reference,
    bool? isSubmitLoading,
    bool? isArchiveLoading,
  }) {
    return InspectionDetailsState(
      isLoading: isLoading ?? this.isLoading,
      inspectionDetails: inspectionDetails ?? this.inspectionDetails,
      reference: reference ?? this.reference,
      isArchiveLoading: isArchiveLoading ?? this.isArchiveLoading,
      isSubmitLoading: isSubmitLoading ?? this.isSubmitLoading,
    );
  }
}
