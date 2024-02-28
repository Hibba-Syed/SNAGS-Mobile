part of 'inspection_cubit.dart';

class InspectionState {
  final bool isLoading;
  final bool loadMore;
  final List<InspectionModel>? inspections;
  final List<Association>? selectedCommunities;
  final List<String>? selectedStatuses;
  final int page;
  const InspectionState({
    this.isLoading = false,
    this.loadMore = false,
    this.inspections,
    this.selectedCommunities,
    this.page = 1,
    this.selectedStatuses,
  });
  InspectionState copyWith({
    bool? isLoading,
    bool? loadMore,
    List<InspectionModel>? inspections,
    List<Association>? selectedCommunities,
    final List<String>? selectedStatuses,
    int? page,

  }) {
    return InspectionState(
      isLoading: isLoading ?? this.isLoading,
      loadMore: loadMore??this.loadMore,
      inspections: inspections ?? this.inspections,
      selectedCommunities: selectedCommunities??this.selectedCommunities,
      selectedStatuses: selectedStatuses ?? this.selectedStatuses,
      page: page ?? this.page,

    );
  }
}
