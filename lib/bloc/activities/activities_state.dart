part of 'activities_cubit.dart';

class ActivitiesState {
  final bool isLoading;
  final bool loadMore;
  final List<UserActivityModel>? userActivities;
  final int page;

  const ActivitiesState({
    this.isLoading = false,
    this.loadMore = false,
    this.userActivities,
    this.page = 1,
  });
  ActivitiesState copyWith({
    bool? isLoading,
    bool? loadMore,
    List<UserActivityModel>? userActivities,
    int? page,
  }) {
    return ActivitiesState(
      isLoading: isLoading ?? this.isLoading,
      loadMore: loadMore??this.loadMore,
      userActivities: userActivities ?? this.userActivities,
      page: page ?? this.page,
    );
  }
}
