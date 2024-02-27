import 'package:flutter/material.dart';
import 'package:iskaan_inspections_mobile/res/constants/app_colors.dart';
import 'package:iskaan_inspections_mobile/res/constants/constants.dart';
import 'package:iskaan_inspections_mobile/view/helper/ui_helper.dart';

class SnagImageStatusWidget extends StatelessWidget {
  final String status;
  const SnagImageStatusWidget({
    super.key,
    required this.status,
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
            status,
            style: TextStyle(
              color: getColor(status),
              fontSize: 10.0,
              fontWeight: FontWeight.w400,
            ),
          ),
          UIHelper.horizontalSpace(5.0),
          Icon(
            (status == AppConstants.snagCompleted.title ||
                    status == AppConstants.snagNew.title)
                ? Icons.access_time_filled
                : (status == AppConstants.snagCompleted.title)
                    ? Icons.check_circle
                    : Icons.cancel,
            color: getColor(status),
            size: 12.0,
          )
        ],
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
