part of 'snag_detail_cubit.dart';

class SnagDetailState {
  final bool isLoading;
  final int carouselIndex;
  final SnagDetails? snagDetails;
  final String? reference;
  const SnagDetailState({
    this.carouselIndex = 0,
    this.isLoading = false,
    this.snagDetails,
    this.reference,
  });
  SnagDetailState copyWith({
    bool? isLoading,
    int? carouselIndex,
    SnagDetails? snagDetails,
    String? reference,
  }) {
    return SnagDetailState(
      isLoading: isLoading ?? this.isLoading,
      carouselIndex: carouselIndex ?? this.carouselIndex,
      snagDetails: snagDetails ?? this.snagDetails,
      reference: reference ?? this.reference,
    );
  }
}
