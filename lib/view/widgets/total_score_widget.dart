import 'package:flutter/material.dart';
import 'package:iskaan_inspections_mobile/view/helper/ui_helper.dart';

class TotalScoreWidget extends StatelessWidget {
  final String score;
  final Color color;
  const TotalScoreWidget({
    super.key,
    required this.score,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
      decoration: BoxDecoration(
        color: color.withOpacity(0.133),
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Total Score:',
            style: TextStyle(
              color: color,
              fontSize: 12.0,
              fontWeight: FontWeight.w600,
            ),
          ),
          UIHelper.horizontalSpace(3.0),
          Text(
            score,
            style: TextStyle(
              color: color,
              fontSize: 12.0,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}
