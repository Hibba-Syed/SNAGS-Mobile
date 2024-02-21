import 'package:flutter/material.dart';
import 'package:iskaan_inspections_mobile/res/constants/app_colors.dart';
import 'package:iskaan_inspections_mobile/res/styles/styles.dart';
import 'package:iskaan_inspections_mobile/view/helper/ui_helper.dart';

class SnagImageStatusWidget extends StatelessWidget {
  final bool isCompleted;
  const SnagImageStatusWidget({
    super.key,
    required this.isCompleted,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 5.0),
      decoration: BoxDecoration(
          color: AppColors.white, borderRadius: BorderRadius.circular(5.0)),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
           Text(
            isCompleted?'Completed':'In Progress',
            style: isCompleted?AppTextStyles.style10Green400:AppTextStyles.style10Yellow400,
          ),
          UIHelper.horizontalSpace(5.0),
            Icon(
             isCompleted? Icons.check_circle:Icons.access_time_filled,
            color: isCompleted?AppColors.green:AppColors.yellow,
            size: 12.0,
          )
        ],
      ),
    );
  }
}
