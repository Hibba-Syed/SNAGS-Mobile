part of 'add_edit_snag_cubit.dart';

class AddEditSnagState {
  final bool isLoading;
  const AddEditSnagState({
    this.isLoading = false,
  });
  AddEditSnagState copyWith({
    bool? isLoading,
    String? selectedRisk,
  }) {
    return AddEditSnagState(
      isLoading: isLoading ?? this.isLoading,
    );
  }
}
