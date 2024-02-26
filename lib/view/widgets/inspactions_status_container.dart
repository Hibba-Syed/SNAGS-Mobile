import 'package:flutter/material.dart';
import 'package:iskaan_inspections_mobile/res/constants/constants.dart';
import 'package:iskaan_inspections_mobile/res/styles/styles.dart';

import '../../res/constants/app_colors.dart';

class InspectionsStatusContainer extends StatelessWidget {
  final String status;
  final int count;
  final VoidCallback onTap;
  const InspectionsStatusContainer({
    super.key,
    required this.status,
    required this.count,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
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
            ),
          ],
        ),
      ),
    );
  }

  Color getColor(String status) {
    if (status == AppConstants.inspectionInProgress.title) {
      return AppConstants.inspectionInProgress.color;
    }
    if (status == AppConstants.inspectionReadyForSubmission.title) {
      return AppConstants.inspectionReadyForSubmission.color;
    }
    if (status == AppConstants.inspectionSubmitted.title) {
      return AppConstants.inspectionSubmitted.color;
    }
    if (status == AppConstants.inspectionRejected.title) {
      return AppConstants.inspectionRejected.color;
    }
    if (status == AppConstants.inspectionApproved.title) {
      return AppConstants.inspectionApproved.color;
    }
    return Colors.white;
  }
}
