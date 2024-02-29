part of 'add_snag_cubit.dart';

class AddSnagState {
  final bool isLoading;
  const AddSnagState({
    this.isLoading = false,
  });
  AddSnagState copyWith({
    bool? isLoading,
    String? selectedRisk,
  }) {
    return AddSnagState(
      isLoading: isLoading ?? this.isLoading,
    );
  }
}
