part of 'community_detail_inspections_cubit.dart';

class CommunityDetailInspectionsState {
  final bool isLoading;
  final bool loadMore;
  final List<InspectionModel>? inspections;
  final int page;
  final Association? community;
  const CommunityDetailInspectionsState({
    this.isLoading = false,
    this.loadMore = false,
    this.inspections,
    this.page = 1,
    this.community,
  });
  CommunityDetailInspectionsState copyWith({
    bool? isLoading,
    bool? loadMore,
    List<InspectionModel>? inspections,
    int? page,
    Association? community,
  }) {
    return CommunityDetailInspectionsState(
      isLoading: isLoading ?? this.isLoading,
      loadMore: loadMore ?? this.loadMore,
      inspections: inspections ?? this.inspections,
      page: page ?? this.page,
      community: community ?? this.community,
    );
  }
}
