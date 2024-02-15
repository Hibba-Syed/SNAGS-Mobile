import 'package:flutter/material.dart';
import 'package:iskaan_inspections_mobile/res/constants/app_colors.dart';
import 'package:iskaan_inspections_mobile/res/styles/styles.dart';
import 'package:iskaan_inspections_mobile/view/screens/inspection/components/how_ratings_work_item.dart';
import 'package:super_tooltip/super_tooltip.dart';

class RatingInfoWidget extends StatelessWidget {
  const RatingInfoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: SuperTooltip(
        showBarrier: true,
        content: const Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'How ratings work',
              style: AppTextStyles.style14Grey600,
            ),
            Divider(),
            HowRatingsWorkItem(
              text: 'No rating given',
            ),
            HowRatingsWorkItem(
              text: 'Zero(0) rating given',
              ratingColor: AppColors.yellow,
            ),
            HowRatingsWorkItem(
              text: 'Not Applicable rating given',
              ratingColor: AppColors.yellow,
              naTextColor: AppColors.white,
              naBackgroundColor: AppColors.red,
            ),
          ],
        ),
        child: const Icon(
          Icons.info_outline,
          color: AppColors.darkGrey,
        ),
      ),
    );
  }
}
