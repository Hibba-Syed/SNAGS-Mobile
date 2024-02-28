part of 'community_detail_statistics_cubit.dart';

class CommunityDetailStatisticsState {
  final bool isLoading;
  final bool loadMore;
  final SnagsStatisticsRecord? snagsStatistics;
  final InspectionsStatisticsRecord? inspectionsStatistics;
  final int page;
  final int? communityId;
  const CommunityDetailStatisticsState({
    this.isLoading = false,
    this.loadMore = false,
    this.snagsStatistics,
    this.inspectionsStatistics,
    this.page = 1,
    this.communityId,
  });
  CommunityDetailStatisticsState copyWith({
    bool? isLoading,
    bool? loadMore,
    SnagsStatisticsRecord? snagsStatistics,
    InspectionsStatisticsRecord? inspectionsStatistics,
    int? page,
    int? communityId,
  }) {
    return CommunityDetailStatisticsState(
      isLoading: isLoading ?? this.isLoading,
      loadMore: loadMore ?? this.loadMore,
      snagsStatistics: snagsStatistics ?? this.snagsStatistics,
      inspectionsStatistics:
          inspectionsStatistics ?? this.inspectionsStatistics,
      page: page ?? this.page,
      communityId: communityId ?? this.communityId,
    );
  }
}
