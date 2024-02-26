import 'package:flutter/material.dart';
import 'package:iskaan_inspections_mobile/res/styles/styles.dart';

import '../../../../res/constants/app_colors.dart';

class InspectionsContainer extends StatelessWidget {
  final String status;
  final String date;
  final VoidCallback? onTap;
  const InspectionsContainer({
    super.key,
    required this.status,
    required this.date,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
        children: [
      Row(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 25),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: const Border(
                bottom: BorderSide(color: AppColors.orange,width: 2),
              ),
            ),
            child:  Column(
              children: [
                Text(
                  date,
                  style: AppTextStyles.style24Grey600,
                ),
                Text(
                  status,
                  style: AppTextStyles.style12Grey400,
                ),
              ],
            ),
          ),
        ],
      ),
    ]);
  }
}
class StatusModel {
  final String title;
  final String description;

  StatusModel({required this.title, required this.description});
}