part of 'inspection_cubit.dart';

class InspectionState {
  final bool isLoading;
  final bool loadMore;
  final List<InspectionModel>? inspections;
  final List<Association>? selectedCommunities;
  final List<String>? selectedCStatuses;
  final int page;
  const InspectionState({
    this.isLoading = false,
    this.loadMore = false,
    this.inspections,
    this.selectedCommunities,
    this.page = 1,
    this.selectedCStatuses,
  });
  InspectionState copyWith({
    bool? isLoading,
    bool? loadMore,
    List<InspectionModel>? inspections,
    List<Association>? selectedCommunities,
    final List<String>? selectedCStatuses,
    int? page,

  }) {
    return InspectionState(
      isLoading: isLoading ?? this.isLoading,
      loadMore: loadMore??this.loadMore,
      inspections: inspections ?? this.inspections,
      selectedCommunities: selectedCommunities??this.selectedCommunities,
      selectedCStatuses: selectedCStatuses ?? this.selectedCStatuses,
      page: page ?? this.page,

    );
  }
}
