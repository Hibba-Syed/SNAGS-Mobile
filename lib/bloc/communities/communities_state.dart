part of 'communities_cubit.dart';

class CommunitiesState {
  final bool isLoading;
  final bool loadMore;
  final List<Association>? communities;
  final int page;
  final InspectionsStatisticsRecord? inspectionsStatistics;
  final SnagsStatisticsRecord? snagsStatistics;
  const CommunitiesState({
    this.isLoading = false,
    this.loadMore=false,
    this.communities,
    this.page=1,
    this.inspectionsStatistics,
    this.snagsStatistics
  });
  CommunitiesState copyWith({
    bool? isLoading,
    bool? loadMore,
    List<Association>? communities,
    InspectionsStatisticsRecord? inspectionsStatistics,
    SnagsStatisticsRecord? snagsStatistics,
    int? page,
  }) {
    return CommunitiesState(
      isLoading: isLoading ?? this.isLoading,
      loadMore: loadMore??this.loadMore,
      communities: communities ?? this.communities,
      page: page??this.page,
      inspectionsStatistics: inspectionsStatistics ?? this.inspectionsStatistics,
      snagsStatistics: snagsStatistics ?? this.snagsStatistics
    );
  }
}
