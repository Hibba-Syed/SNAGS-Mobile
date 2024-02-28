part of 'community_detail_inspections_cubit.dart';

class CommunityDetailInspectionsState {
  final bool isLoading;
  final bool loadMore;
  final List<InspectionModel>? inspections;
  final int page;
  final int? communityId;
  const CommunityDetailInspectionsState({
    this.isLoading = false,
    this.loadMore = false,
    this.inspections,
    this.page = 1,
    this.communityId,
  });
  CommunityDetailInspectionsState copyWith({
    bool? isLoading,
    bool? loadMore,
    List<InspectionModel>? inspections,
    int? page,
    int? communityId,
  }) {
    return CommunityDetailInspectionsState(
      isLoading: isLoading ?? this.isLoading,
      loadMore: loadMore ?? this.loadMore,
      inspections: inspections ?? this.inspections,
      page: page ?? this.page,
      communityId: communityId ?? this.communityId,
    );
  }
}
