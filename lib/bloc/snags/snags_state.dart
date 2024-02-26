part of 'snags_cubit.dart';

class SnagsState {
  final bool isLoading;
  final List<SnagModel>? snags;
  const SnagsState({
    this.isLoading = false,
    this.snags,
  });
  SnagsState copyWith({
    bool? isLoading,
    List<SnagModel>? snags,
  }) {
    return  SnagsState(
      isLoading: isLoading ?? this.isLoading,
      snags: snags ?? this.snags,
    );
  }
}
