import 'package:flutter/material.dart';
import 'package:iskaan_inspections_mobile/res/constants/app_colors.dart';
import 'package:iskaan_inspections_mobile/res/styles/styles.dart';
import 'package:iskaan_inspections_mobile/view/helper/ui_helper.dart';

class RowTitleWithViewMore extends StatelessWidget {
  final String text;
  final VoidCallback onViewMorePressed;
  const RowTitleWithViewMore({
    super.key,
    required this.text,
    required this.onViewMorePressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical:10.0),
      child:Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            text,
            style: AppTextStyles.style20Grey600,
          ),
          InkWell(
            onTap: onViewMorePressed,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(
                  Icons.remove_red_eye_outlined,
                  color: AppColors.primary,
                  size: 20,
                ),
                UIHelper.horizontalSpace(4.0),
                const Text(
                  'View More',
                  style: AppTextStyles.style16Primary400,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
