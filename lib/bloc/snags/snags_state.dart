part of 'snags_cubit.dart';

class SnagsState {
  final bool isLoading;
  final bool loadMore;
  final List<SnagModel>? snags;
  final List<Company>? selectedCompanies;
  final List<String>? selectedStatuses;
  final List<Association>? selectedCommunities;
  final String? fromDate;
  final String? toDate;
  final int page;
  final String? searchKeyword;
  const SnagsState({
    this.isLoading = false,
    this.loadMore = false,
    this.snags,
    this.page = 1,
    this.selectedCompanies,
    this.selectedStatuses,
    this.selectedCommunities,
    this.toDate,
    this.fromDate,
    this.searchKeyword,
  });
  SnagsState copyWith({
    bool? isLoading,
    bool? loadMore,
    List<SnagModel>? snags,
    List<Company>? selectedCompanies,
    List<String>? selectedStatuses,
    List<Association>? selectedCommunities,
    final String? fromDate,
    final String? toDate,
    int? page,
    String? searchKeyword,
  }) {
    return SnagsState(
      isLoading: isLoading ?? this.isLoading,
      loadMore: loadMore ?? this.loadMore,
      snags: snags ?? this.snags,
      page: page ?? this.page,
      selectedCompanies: selectedCompanies ?? this.selectedCompanies,
      selectedStatuses: selectedStatuses ?? this.selectedStatuses,
      selectedCommunities: selectedCommunities ?? this.selectedCommunities,
      fromDate: fromDate ?? this.fromDate,
      toDate: toDate ?? this.toDate,
      searchKeyword: searchKeyword?? this.searchKeyword,
    );
  }
}
