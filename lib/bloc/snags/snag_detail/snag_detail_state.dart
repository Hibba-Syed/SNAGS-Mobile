part of 'snag_detail_cubit.dart';

class SnagDetailState {
  final int carouselIndex;
  const SnagDetailState({
    this.carouselIndex = 1,
  });
  SnagDetailState copyWith({
    int? carouselIndex,
  }) {
    return  SnagDetailState(
      carouselIndex: carouselIndex??this.carouselIndex,
    );
  }
}
