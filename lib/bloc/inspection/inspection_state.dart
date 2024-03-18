part of 'inspection_cubit.dart';

class InspectionState {
  final bool isLoading;
  final bool loadMore;
  final List<InspectionModel>? inspections;
  final List<Company>? selectedCompanies;
  final List<Association>? selectedCommunities;
  final List<String>? selectedStatuses;

  final String? fromDate;
  final String? toDate;
  final int page;
  const InspectionState({
    this.isLoading = false,
    this.loadMore = false,
    this.inspections,
    this.selectedCompanies,
    this.selectedCommunities,
    this.page = 1,
    this.selectedStatuses,
    this.fromDate,
    this.toDate,
  });
  InspectionState copyWith({
    bool? isLoading,
    bool? loadMore,
    List<InspectionModel>? inspections,
    List<Company>? selectedCompanies,
    List<Association>? selectedCommunities,
    final List<String>? selectedStatuses,
    final String? fromDate,
    final String? toDate,
    int? page,

  }) {
    return InspectionState(
      isLoading: isLoading ?? this.isLoading,
      loadMore: loadMore??this.loadMore,
      inspections: inspections ?? this.inspections,
      selectedCompanies: selectedCompanies??this.selectedCompanies,
      selectedCommunities: selectedCommunities??this.selectedCommunities,
      selectedStatuses: selectedStatuses ?? this.selectedStatuses,
      fromDate: fromDate ?? this.fromDate,
      toDate: toDate ?? this.toDate,
      page: page ?? this.page,

    );
  }
}
