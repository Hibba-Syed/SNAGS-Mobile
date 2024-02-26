import 'package:flutter/material.dart';
import 'package:iskaan_inspections_mobile/res/constants/constants.dart';
import 'package:iskaan_inspections_mobile/view/helper/ui_helper.dart';

class InspectionStatusWidget extends StatelessWidget {
  final String status;
  const InspectionStatusWidget({
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
