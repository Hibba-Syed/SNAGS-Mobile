part of 'inspection_cubit.dart';

class InspectionState {
  final bool isLoading;
  final bool loadMore;
  final List<InspectionModel>? inspections;
  final int page;
  const InspectionState({
    this.isLoading = false,
    this.loadMore = false,
    this.inspections,
    this.page = 1,
  });
  InspectionState copyWith({
    bool? isLoading,
    bool? loadMore,
    List<InspectionModel>? inspections,
    int? page,
  }) {
    return InspectionState(
      isLoading: isLoading ?? this.isLoading,
      loadMore: loadMore??this.loadMore,
      inspections: inspections ?? this.inspections,
      page: page ?? this.page,
    );
  }
}
