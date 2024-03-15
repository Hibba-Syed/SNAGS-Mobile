part of 'community_detail_snags_cubit.dart';

class CommunityDetailSnagsState {
  final bool isLoading;
  final bool loadMore;
  final List<SnagModel>? snags;
  final int page;
  final Association? community;
  const CommunityDetailSnagsState({
    this.isLoading = false,
    this.loadMore = false,
    this.snags,
    this.page = 1,
    this.community,
  });
  CommunityDetailSnagsState copyWith({
    bool? isLoading,
    bool? loadMore,
    List<SnagModel>? snags,
    int? page,
    Association? community,
  }) {
    return CommunityDetailSnagsState(
      isLoading: isLoading ?? this.isLoading,
      loadMore: loadMore ?? this.loadMore,
      snags: snags ?? this.snags,
      page: page ?? this.page,
      community: community ?? this.community,
    );
  }
}
