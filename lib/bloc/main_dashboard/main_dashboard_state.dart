part of 'main_dashboard_cubit.dart';

class MainDashboardState {
  final int selectedIndex;
  const MainDashboardState({
    this.selectedIndex = 1,
  });
  MainDashboardState copyWith({
    int? selectedIndex,
  }) {
    return MainDashboardState(
      selectedIndex: selectedIndex ?? this.selectedIndex,
    );
  }
}
