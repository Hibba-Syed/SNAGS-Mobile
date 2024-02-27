part of 'inspection_details_cubit.dart';

class InspectionDetailsState {
  final bool isLoading;
  final InspectionDetails? inspectionDetails;
  const InspectionDetailsState({
    this.isLoading = false,
    this.inspectionDetails,
  });
  InspectionDetailsState copyWith({
    bool? isLoading,
    InspectionDetails? inspectionDetails,
  }) {
    return InspectionDetailsState(
      isLoading: isLoading ?? this.isLoading,
      inspectionDetails: inspectionDetails ?? this.inspectionDetails,
    );
  }
}
