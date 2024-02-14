import 'package:flutter/material.dart';
import 'package:iskaan_inspections_mobile/view/helper/ui_helper.dart';

class RiskWidget extends StatelessWidget {
  final String risk;
  final Color color;
  const RiskWidget({
    super.key,
    required this.risk,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          Icons.circle,
          color: color,
          size: 10,
        ),
        UIHelper.horizontalSpace(3.0),
        Text(
          risk,
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w400,
            color: color,
          ),
        ),
      ],
    );
  }
}
