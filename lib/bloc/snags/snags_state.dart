part of 'snags_cubit.dart';

class SnagsState {
  final bool isLoading;
  final bool loadMore;
  final List<SnagModel>? snags;
  final List<String>? selectedStatuses;
  final List<Association>? selectedCommunities;
  final int page;
  const SnagsState({
    this.isLoading = false,
    this.loadMore = false,
    this.snags,
    this.page = 1,
    this.selectedStatuses,
    this.selectedCommunities,
  });
  SnagsState copyWith({
    bool? isLoading,
    bool? loadMore,
    List<SnagModel>? snags,
    List<String>? selectedStatuses,
    List<Association>? selectedCommunities,
    int? page,
  }) {
    return SnagsState(
      isLoading: isLoading ?? this.isLoading,
      loadMore: loadMore ?? this.loadMore,
      snags: snags ?? this.snags,
      page: page ?? this.page,
      selectedStatuses: selectedStatuses ?? this.selectedStatuses,
      selectedCommunities: selectedCommunities ?? this.selectedCommunities,
    );
  }
}
