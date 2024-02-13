import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:iskaan_inspections_mobile/res/constants/app_colors.dart';
import 'package:iskaan_inspections_mobile/res/constants/images.dart';
import 'package:iskaan_inspections_mobile/res/styles/styles.dart';
import 'package:iskaan_inspections_mobile/view/helper/ui_helper.dart';

class ActionRequiredItemWidget extends StatelessWidget {
  final int count;
  final bool isInspection;
  final String status;
  final VoidCallback onTap;
  const ActionRequiredItemWidget({
    super.key,
    required this.count,
    required this.isInspection,
    required this.status,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(6.0),
        decoration: BoxDecoration(
            color: Colors.grey.shade100,
            borderRadius: BorderRadius.circular(5.0)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Row(
                children: [
                  SvgPicture.asset(
                    isInspection ? AppImages.icInspection : AppImages.icSnags,
                    colorFilter: const ColorFilter.mode(
                      AppColors.primary,
                      BlendMode.srcIn,
                    ),
                  ),
                  UIHelper.horizontalSpace(3.0),
                  Text(
                    count.toString(),
                    style: AppTextStyles.style14Grey600,
                  ),
                  UIHelper.horizontalSpace(3.0),
                  Text(
                    isInspection ? 'Inspection(s)' : 'Snag(s)',
                    style: AppTextStyles.style14LightGrey400,
                  ),
                  UIHelper.horizontalSpace(3.0),
                  Text(
                    status,
                    style: AppTextStyles.style14Grey600,
                  ),
                ],
              ),
            ),
            UIHelper.horizontalSpace(10.0),
            const Icon(
              Icons.arrow_forward,
              color: AppColors.primary,
            ),
          ],
        ),
      ),
    );
  }
}
