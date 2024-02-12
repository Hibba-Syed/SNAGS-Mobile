import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:iskaan_inspections_mobile/res/constants/app_colors.dart';
import 'package:iskaan_inspections_mobile/res/constants/images.dart';
import 'package:iskaan_inspections_mobile/res/styles/styles.dart';
import 'package:iskaan_inspections_mobile/view/helper/ui_helper.dart';
import 'package:iskaan_inspections_mobile/view/widgets/decreasing_percentage_widget.dart';
class HighRiskSnagsContainer extends StatelessWidget {
   HighRiskSnagsContainer({super.key});
  final List<Color> _highRiskSnagsGradientColor = [
    AppColors.pink,
    AppColors.lightPink,
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
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade400,
            blurRadius: 5.0,
          ),
        ],
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
                  color: AppColors.pink,
                  shape: BoxShape.circle,
                ),
                child: SvgPicture.asset(
                  AppImages.icSnags,
                  colorFilter: const ColorFilter.mode(
                    AppColors.white,
                    BlendMode.srcIn,
                  ),
                ),
              ),
              UIHelper.horizontalSpace(5.0),
              const Text(
                'High Risk Snags',
                style: AppTextStyles.style14LightGrey500,
              ),
            ],
          ),
          UIHelper.verticalSpace(5.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    '35',
                    style: AppTextStyles.style22Grey600,
                  ),
                  UIHelper.verticalSpace(5.0),
                  const DecreasingPercentageWidget(
                    value: '1.2%',
                  ),
                ],
              ),
              SizedBox(
                width: 100,
                height: 50,
                child: LineChart(
                  _highRiskSnagsChartData(),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
  LineChartData _highRiskSnagsChartData() {
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
          spots: const [
            FlSpot(0, 3),
            FlSpot(2.6, 2),
            FlSpot(4.9, 5),
            FlSpot(6.8, 3.1),
            FlSpot(8, 4),
            FlSpot(9.5, 3),
            FlSpot(11, 4),
          ],
          isCurved: true,
          gradient: LinearGradient(
            colors: _highRiskSnagsGradientColor,
          ),
          barWidth: 5,
          isStrokeCapRound: true,
          dotData: const FlDotData(
            show: false,
          ),
          belowBarData: BarAreaData(
            show: true,
            gradient: LinearGradient(
              colors: _highRiskSnagsGradientColor
                  .map((color) => color.withOpacity(0.3))
                  .toList(),
            ),
          ),
        ),
      ],
    );
  }
}
