import 'package:flutter/material.dart';
import 'package:iskaan_inspections_mobile/res/constants/constants.dart';
import 'package:iskaan_inspections_mobile/view/helper/ui_helper.dart';

class RiskWidget extends StatelessWidget {
  final String risk;
  const RiskWidget({
    super.key,
    required this.risk,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          Icons.circle,
          color: getColor(risk),
          size: 10,
        ),
        UIHelper.horizontalSpace(3.0),
        Text(
          risk,
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w400,
            color: getColor(risk),
          ),
        ),
      ],
    );
  }
  Color getColor(String risk) {
    if (risk == AppConstants.snagNoRisk.title) {
      return AppConstants.snagNew.color;
    }
    if (risk == AppConstants.snagLowRisk.title) {
      return AppConstants.snagLowRisk.color;
    }
    if (risk == AppConstants.snagMediumRisk.title) {
      return AppConstants.snagMediumRisk.color;
    }
    if (risk == AppConstants.snagHighRisk.title) {
      return AppConstants.snagHighRisk.color;
    }
    return Colors.white;
  }
}
