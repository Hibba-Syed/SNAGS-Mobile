part of 'dashboard_cubit.dart';

class DashboardState {
  final bool isFloatingButtonExpanded;
  final bool isLoading;
  final ProfileRecord? profileRecord;
  final InspectionsStatisticsRecord? inspectionsStatistics;
  final SnagsStatisticsRecord? snagsStatistics;
  final List<InspectionModel>? recentInspections;
  final List<SnagModel>? recentSnags;
  final List<SnagsStatisticsByMonthRecord>? snagsStatisticsByMonth;
  final List<InspectionsStatisticsByMonthRecord>? inspectionsStatisticsByMonth;
  const DashboardState({
    this.isFloatingButtonExpanded = false,
    this.isLoading = false,
    this.profileRecord,
    this.inspectionsStatistics,
    this.snagsStatistics,
    this.recentInspections,
    this.recentSnags,
    this.snagsStatisticsByMonth,
    this.inspectionsStatisticsByMonth,
  });
  DashboardState copyWith({
    bool? isFloatingButtonExpanded,
    bool? isLoading,
    ProfileRecord? profileRecord,
    InspectionsStatisticsRecord? inspectionsStatistics,
    SnagsStatisticsRecord? snagsStatistics,
    List<InspectionModel>? recentInspections,
    List<SnagModel>? recentSnags,
    List<SnagsStatisticsByMonthRecord>? snagsStatisticsByMonth,
    List<InspectionsStatisticsByMonthRecord>? inspectionsStatisticsByMonth,
  }) {
    return DashboardState(
      isFloatingButtonExpanded:
          isFloatingButtonExpanded ?? this.isFloatingButtonExpanded,
      isLoading: isLoading ?? this.isLoading,
      profileRecord: profileRecord ?? this.profileRecord,
      inspectionsStatistics:
          inspectionsStatistics ?? this.inspectionsStatistics,
      snagsStatistics: snagsStatistics ?? this.snagsStatistics,
      recentInspections: recentInspections ?? this.recentInspections,
      recentSnags: recentSnags ?? this.recentSnags,
      snagsStatisticsByMonth: snagsStatisticsByMonth??this.snagsStatisticsByMonth,
      inspectionsStatisticsByMonth: inspectionsStatisticsByMonth??this.inspectionsStatisticsByMonth,
    );
  }
}
