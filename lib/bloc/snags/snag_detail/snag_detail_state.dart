part of 'snag_detail_cubit.dart';

class SnagDetailState {
  final bool isLoading;
  final int carouselIndex;
  final SnagModel? snagDetails;
  final String? reference;
  final List<SnagModel>? snagsToMerge;
  final List<SnagModel>? selectedSnagsToMerge;
  final bool isSnagsToMergeLoading;
  final bool isMergeLoading;
  final bool isStartLoading;
  final bool isCompleteLoading;
  final bool isCancelLoading;
  const SnagDetailState({
    this.carouselIndex = 0,
    this.isLoading = false,
    this.snagDetails,
    this.reference,
    this.snagsToMerge,
    this.selectedSnagsToMerge,
    this.isSnagsToMergeLoading = false,
    this.isMergeLoading = false,
    this.isStartLoading = false,
    this.isCompleteLoading = false,
    this.isCancelLoading = false,
  });
  SnagDetailState copyWith({
    bool? isLoading,
    int? carouselIndex,
    SnagModel? snagDetails,
    String? reference,
    List<SnagModel>? snagsToMerge,
    List<SnagModel>? selectedSnagsToMerge,
    bool? isSnagsToMergeLoading,
    bool? isMergeLoading,
    bool? isStartLoading,
    bool? isCompleteLoading,
    bool? isCancelLoading,
  }) {
    return SnagDetailState(
      isLoading: isLoading ?? this.isLoading,
      carouselIndex: carouselIndex ?? this.carouselIndex,
      snagDetails: snagDetails ?? this.snagDetails,
      reference: reference ?? this.reference,
      snagsToMerge: snagsToMerge ?? this.snagsToMerge,
      selectedSnagsToMerge: selectedSnagsToMerge ?? this.selectedSnagsToMerge,
      isSnagsToMergeLoading:
          isSnagsToMergeLoading ?? this.isSnagsToMergeLoading,
      isMergeLoading: isMergeLoading ?? this.isMergeLoading,
      isStartLoading: isStartLoading ?? this.isStartLoading,
      isCompleteLoading: isCompleteLoading ?? this.isCompleteLoading,
      isCancelLoading: isCancelLoading ?? this.isCancelLoading,
    );
  }
}
