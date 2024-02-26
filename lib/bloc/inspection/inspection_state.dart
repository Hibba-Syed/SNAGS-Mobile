part of 'inspection_cubit.dart';

class InspectionState {
  final bool isLoading;
  final List<InspectionModel>? inspections;
  const InspectionState({this.isLoading = false, this.inspections});
  InspectionState copyWith({
    bool? isLoading,
    List<InspectionModel>? inspections,
  }) {
    return InspectionState(
      isLoading: isLoading ?? this.isLoading,
      inspections: inspections ?? this.inspections,
    );
  }
}
