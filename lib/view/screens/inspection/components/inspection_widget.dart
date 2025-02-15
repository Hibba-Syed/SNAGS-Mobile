import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:iskaan_inspections_mobile/bloc/inspection/detail/inspection_details_cubit.dart';
import 'package:iskaan_inspections_mobile/res/constants/app_colors.dart';
import 'package:iskaan_inspections_mobile/res/constants/images.dart';
import 'package:iskaan_inspections_mobile/res/styles/styles.dart';
import 'package:iskaan_inspections_mobile/utils/date_time.dart';
import 'package:iskaan_inspections_mobile/utils/routes/app_routes.dart';
import 'package:iskaan_inspections_mobile/view/helper/ui_helper.dart';
import 'package:iskaan_inspections_mobile/view/widgets/date_text_widget.dart';
import 'package:iskaan_inspections_mobile/view/widgets/status/inspection_status_widget.dart';

class InspectionWidget extends StatelessWidget {
  final int? id;
  final String reference;
  final String status;
  final String communityName;
  final String companyName;
  final String userName;
  final String? date;
  final VoidCallback? onTap;
  const InspectionWidget({
    super.key,
    required this.id,
    required this.reference,
    required this.status,
    required this.communityName,
    required this.companyName,
    required this.userName,
    required this.date,
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
                InspectionStatusWidget(
                  status: status,
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
                DateTextWidget(
                  date: DateTimeUtil.getFormattedDate(date),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
