part of 'dashboard_cubit.dart';

class DashboardState {
  final bool isFloatingButtonExpanded;
  const DashboardState({
    this.isFloatingButtonExpanded = false,
  });
  DashboardState copyWith({
    bool? isFloatingButtonExpanded,
  }) {
    return DashboardState(
        isFloatingButtonExpanded:
            isFloatingButtonExpanded ?? this.isFloatingButtonExpanded);
  }
}
