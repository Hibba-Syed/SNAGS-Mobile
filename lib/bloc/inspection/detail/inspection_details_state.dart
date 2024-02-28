part of 'inspection_details_cubit.dart';

class InspectionDetailsState {
  final bool isLoading;
  final InspectionDetails? inspectionDetails;
  final String? reference;
  const InspectionDetailsState({
    this.isLoading = false,
    this.inspectionDetails,
    this.reference,
  });
  InspectionDetailsState copyWith({
    bool? isLoading,
    InspectionDetails? inspectionDetails,
    String? reference,
  }) {
    return InspectionDetailsState(
      isLoading: isLoading ?? this.isLoading,
      inspectionDetails: inspectionDetails ?? this.inspectionDetails,
      reference: reference?? this.reference,
    );
  }
}
