import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:iskaan_inspections_mobile/res/constants/app_colors.dart';
import 'package:iskaan_inspections_mobile/res/constants/images.dart';
import 'package:iskaan_inspections_mobile/res/styles/styles.dart';
import 'package:iskaan_inspections_mobile/view/helper/ui_helper.dart';

class CommunityWidget extends StatelessWidget {
  final String communityName;
  final String companyName;
  final VoidCallback onTap;
  const CommunityWidget({
    super.key,
    required this.communityName,
    required this.companyName,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(5.0),

        ),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(6.0),
              decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(5.0)),
              child: Row(
                children: [
                  SvgPicture.asset(
                    AppImages.icCommunities,
                    colorFilter: const ColorFilter.mode(
                      AppColors.primary,
                      BlendMode.srcIn,
                    ),
                  ),
                  UIHelper.horizontalSpace(4.0),
                  Flexible(
                    child: Text(
                      communityName,
                      style: AppTextStyles.style14Grey400,
                    ),
                  ),
                ],
              ),
            ),
            UIHelper.verticalSpace(10.0),
            Container(
              padding: const EdgeInsets.all(6.0),
              decoration: BoxDecoration(
                color: AppColors.white,
                border: Border.all(color: AppColors.border),
                borderRadius: BorderRadius.circular(5.0),
              ),
              child: Row(
                children: [
                  SvgPicture.asset(
                    AppImages.icCommunityOwner,
                    colorFilter: const ColorFilter.mode(
                      AppColors.primary,
                      BlendMode.srcIn,
                    ),
                  ),
                  UIHelper.horizontalSpace(4.0),
                  Flexible(
                    child: Text(
                      companyName,
                      style: AppTextStyles.style14Grey400,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
