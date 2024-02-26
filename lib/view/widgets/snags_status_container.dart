import 'package:flutter/material.dart';
import 'package:iskaan_inspections_mobile/res/constants/constants.dart';
import 'package:iskaan_inspections_mobile/res/styles/styles.dart';

import '../../res/constants/app_colors.dart';

class SnagsStatusContainer extends StatelessWidget {
  final String status;
  final int count;
  final VoidCallback onTap;
  const SnagsStatusContainer({
    super.key,
    required this.status,
    required this.count,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border(
            bottom: BorderSide(color: getColor(status), width: 2),
          ),
        ),
        child: Column(
          children: [
            Text(
              count.toString(),
              style: AppTextStyles.style24Grey600,
            ),
            Text(
              status,
              style: AppTextStyles.style12Grey400,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }

  Color getColor(String status) {
    if (status == AppConstants.snagNew.title) {
      return AppConstants.snagNew.color;
    }
    if (status == AppConstants.snagInProgress.title) {
      return AppConstants.snagInProgress.color;
    }
    if (status == AppConstants.snagCompleted.title) {
      return AppConstants.snagCompleted.color;
    }
    if (status == AppConstants.snagCancelled.title) {
      return AppConstants.snagCancelled.color;
    }
    return Colors.white;
  }
}
