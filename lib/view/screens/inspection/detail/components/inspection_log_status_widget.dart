import 'package:flutter/material.dart';
import 'package:iskaan_inspections_mobile/res/constants/constants.dart';
import 'package:iskaan_inspections_mobile/view/helper/ui_helper.dart';

class InspectionLogStatusWidget extends StatelessWidget {
  final String status;
  const InspectionLogStatusWidget({
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
    if (status == AppConstants.inspectionLogApproved.title) {
      return AppConstants.inspectionLogApproved.color;
    }
    if (status == AppConstants.inspectionLogArchived.title) {
      return AppConstants.inspectionLogArchived.color;
    }
    if (status == AppConstants.inspectionLogCreated.title) {
      return AppConstants.inspectionLogCreated.color;
    }
    if (status == AppConstants.inspectionLogRejected.title) {
      return AppConstants.inspectionLogRejected.color;
    }
    if (status == AppConstants.inspectionLogSubmitted.title) {
      return AppConstants.inspectionLogSubmitted.color;
    }
    if (status == AppConstants.inspectionLogUpdated.title) {
      return AppConstants.inspectionLogUpdated.color;
    }
    return Colors.white;
  }
}
