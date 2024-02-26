part of 'communities_cubit.dart';

class CommunitiesState {
  final bool isLoading;
  final bool loadMore;
  final List<Association>? communities;
  final int page;
  const CommunitiesState({
    this.isLoading = false,
    this.loadMore=false,
    this.communities,
    this.page=1,
  });
  CommunitiesState copyWith({
    bool? isLoading,
    bool? loadMore,
    List<Association>? communities,
    int? page,
  }) {
    return CommunitiesState(
      isLoading: isLoading ?? this.isLoading,
      loadMore: loadMore??this.loadMore,
      communities: communities ?? this.communities,
      page: page??this.page,
    );
  }
}
