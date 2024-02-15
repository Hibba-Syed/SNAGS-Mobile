import 'package:flutter/material.dart';
import 'package:iskaan_inspections_mobile/res/constants/app_colors.dart';
import 'package:iskaan_inspections_mobile/res/styles/styles.dart';
import 'package:iskaan_inspections_mobile/view/helper/ui_helper.dart';

class ProfileRowButton extends StatelessWidget {
  final String title;
  final IconData iconData;
  final VoidCallback onTap;
  const ProfileRowButton({
    super.key,
    required this.title,
    required this.iconData,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 5.0),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(2.0),
              decoration: BoxDecoration(
                  border: Border.all(color: AppColors.lightGrey.withOpacity(0.3)),
                  borderRadius: BorderRadius.circular(5.0)),
              child:  Icon(
                iconData,
                color: AppColors.lightGrey,
                size: 18.0,
              ),
            ),
            UIHelper.horizontalSpace(5.0),
             Text(
              title,
              style: AppTextStyles.style14LightGrey400,
            ),
          ],
        ),
      ),
    );
  }
}
