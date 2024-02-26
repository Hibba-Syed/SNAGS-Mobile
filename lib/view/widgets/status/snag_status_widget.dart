import 'package:flutter/material.dart';
import 'package:iskaan_inspections_mobile/res/constants/constants.dart';
import 'package:iskaan_inspections_mobile/view/helper/ui_helper.dart';

class SnagStatusWidget extends StatelessWidget {
  final String status;
  const SnagStatusWidget({
    super.key,
    required this.status,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
      decoration: BoxDecoration(
        color: getColor(status).withOpacity(0.13),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.circle,
            color: getColor(status),
            size: 10,
          ),
          UIHelper.horizontalSpace(3.0),
          Text(
            status,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: getColor(status),
            ),
          ),
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
