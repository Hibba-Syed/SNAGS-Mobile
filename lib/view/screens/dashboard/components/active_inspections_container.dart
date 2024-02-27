import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:iskaan_inspections_mobile/bloc/dashboard/dashboard_cubit.dart';
import 'package:iskaan_inspections_mobile/res/constants/app_colors.dart';
import 'package:iskaan_inspections_mobile/res/constants/images.dart';
import 'package:iskaan_inspections_mobile/res/styles/styles.dart';
import 'package:iskaan_inspections_mobile/view/helper/ui_helper.dart';

class ActiveInspectionsContainer extends StatelessWidget {
  ActiveInspectionsContainer({super.key});

  final List<Color> _pendingInspectionsGradientColors = [
    AppColors.green,
    AppColors.lightGreen,
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width / 1.75,
      padding: const EdgeInsets.all(10.0),
      margin: const EdgeInsets.only(right: 12.0),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                width: 20.0,
                height: 20.0,
                padding: const EdgeInsets.all(2.0),
                decoration: const BoxDecoration(
                  color: AppColors.orange,
                  shape: BoxShape.circle,
                ),
                child: SvgPicture.asset(
                  AppImages.icInspection,
                  colorFilter: const ColorFilter.mode(
                    AppColors.white,
                    BlendMode.srcIn,
                  ),
                ),
              ),
              UIHelper.horizontalSpace(5.0),
              const Text(
                'Active Inspections',
                style: AppTextStyles.style14LightGrey500,
              ),
            ],
          ),
          UIHelper.verticalSpace(5.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                getTotalActiveInspections(context),
                style: AppTextStyles.style22Grey600,
              ),
              SizedBox(
                width: 100,
                height: 50,
                child: LineChart(
                  _pendingInspectionsChartData(context),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  LineChartData _pendingInspectionsChartData(BuildContext context) {
    return LineChartData(
      gridData: FlGridData(
        show: false,
        getDrawingVerticalLine: (value) {
          return const FlLine(
            color: AppColors.green,
            strokeWidth: 1,
          );
        },
      ),
      titlesData: const FlTitlesData(
        show: false,
      ),
      borderData: FlBorderData(
        show: false,
        border: Border.all(color: const Color(0xff37434d)),
      ),
      minX: 0,
      maxX: 12,
      minY: 0,
      maxY: 6,
      lineBarsData: [
        LineChartBarData(
          spots: getSpots(context),
          isCurved: true,
          gradient: LinearGradient(
            colors: _pendingInspectionsGradientColors,
          ),
          barWidth: 5,
          isStrokeCapRound: true,
          dotData: const FlDotData(
            show: false,
          ),
          belowBarData: BarAreaData(
            show: true,
            gradient: LinearGradient(
              colors: _pendingInspectionsGradientColors
                  .map((color) => color.withOpacity(0.3))
                  .toList(),
            ),
          ),
        ),
      ],
    );
  }

  String getTotalActiveInspections(BuildContext context) {
    if (context
        .read<DashboardCubit>()
        .getActiveInspectionsStatistics()
        .isNotEmpty) {
      return context
          .read<DashboardCubit>()
          .getActiveInspectionsStatistics()
          .reduce((value, element) => value + element)
          .toString();
    }
    return '0';
  }

  List<FlSpot> getSpots(BuildContext context) {
    List<FlSpot> values = [];
    context
        .read<DashboardCubit>()
        .getActiveInspectionsStatistics()
        .forEach((element) {
      values.add(FlSpot(element.toDouble(), element.toDouble()));
    });
    return values;
  }
}
