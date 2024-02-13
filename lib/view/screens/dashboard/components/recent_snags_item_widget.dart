import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:iskaan_inspections_mobile/res/constants/app_colors.dart';
import 'package:iskaan_inspections_mobile/res/constants/images.dart';
import 'package:iskaan_inspections_mobile/res/styles/app_styles.dart';
import 'package:iskaan_inspections_mobile/res/styles/styles.dart';
import 'package:iskaan_inspections_mobile/view/helper/ui_helper.dart';
import 'package:iskaan_inspections_mobile/view/widgets/status_widget.dart';

class RecentSnagsItemWidget extends StatelessWidget {
  final String reference;
  final String status;
  final String risk;
  final String communityName;
  final String userName;
  final String date;
  final VoidCallback? onTap;
  const RecentSnagsItemWidget({
    super.key,
    required this.reference,
    required this.status,
    required this.risk,
    required this.communityName,
    required this.userName,
    required this.date,
    this.onTap,
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
          boxShadow: [
            AppStyles.cardBoxShadow,
          ],
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Transform.rotate(
                      angle: 40,
                      child: const Icon(
                        Icons.link,
                        color: AppColors.primary,
                      ),
                    ),
                    UIHelper.horizontalSpace(3.0),
                    Text(
                      reference,
                      style: AppTextStyles.style14Grey600,
                    ),
                  ],
                ),
                Row(
                  children: [
                    Row(
                      children: [
                        const Icon(
                          Icons.circle,
                          color: AppColors.green,
                          size: 10,
                        ),
                        UIHelper.horizontalSpace(3.0),
                        Text(
                          risk,
                          style: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: AppColors.green,
                          ),
                        ),
                      ],
                    ),
                    UIHelper.horizontalSpace(5.0),
                    StatusWidget(
                      status: status,
                      color: AppColors.red,
                    ),
                  ],
                ),
              ],
            ),
            UIHelper.verticalSpace(10.0),
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
                  Text(
                    communityName,
                    style: AppTextStyles.style14Grey400,
                  ),
                ],
              ),
            ),
            UIHelper.verticalSpace(10.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    const Icon(
                      Icons.person_outline,
                      size: 20,
                    ),
                    UIHelper.horizontalSpace(3.0),
                    Text(
                      userName,
                      style: AppTextStyles.style14LightGrey400,
                    ),
                  ],
                ),
                Row(
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
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
