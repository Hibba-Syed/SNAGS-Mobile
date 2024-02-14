import 'package:flutter/material.dart';
import 'package:iskaan_inspections_mobile/res/constants/app_colors.dart';
import 'package:iskaan_inspections_mobile/res/styles/styles.dart';
import 'package:iskaan_inspections_mobile/view/helper/ui_helper.dart';

class DateTextWidget extends StatelessWidget {
  final String date;
  const DateTextWidget({
    super.key,
    required this.date,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Icon(
          Icons.date_range_outlined,
          color: AppColors.primary,
          size: 18.0,
        ),
        UIHelper.horizontalSpace(3.0),
        Text(
          date,
          style: AppTextStyles.style14LightGrey400,
        ),
      ],
    );
  }
}
