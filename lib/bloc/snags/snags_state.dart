part of 'snags_cubit.dart';

class SnagsState {
  final bool isLoading;
  final bool loadMore;
  final List<SnagModel>? snags;
  final int page;
  const SnagsState({
    this.isLoading = false,
    this.loadMore=false,
    this.snags,
    this.page = 1,
  });
  SnagsState copyWith({
    bool? isLoading,
    bool? loadMore,
    List<SnagModel>? snags,
    int? page,
  }) {
    return SnagsState(
      isLoading: isLoading ?? this.isLoading,
      loadMore: loadMore??this.loadMore,
      snags: snags ?? this.snags,
      page: page ?? this.page,
    );
  }
}
