import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:iskaan_inspections_mobile/res/constants/app_colors.dart';
import 'package:iskaan_inspections_mobile/res/styles/styles.dart';

class DrawerListTile extends StatelessWidget {
  final String title;
  final String iconPath;
  final VoidCallback onTap;
  final bool isSelected;
  const DrawerListTile({
    super.key,
    required this.title,
    required this.iconPath,
    required this.onTap,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      tileColor: isSelected?Colors.grey.shade200:Colors.transparent,
      shape: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.0),
        borderSide: const BorderSide(
          color: Colors.transparent,
        )
      ),
      contentPadding:  EdgeInsets.zero,
      leading: Container(
        padding: const EdgeInsets.all(3.0),
        decoration: BoxDecoration(
            color: isSelected ? AppColors.primary : Colors.transparent,
            borderRadius: BorderRadius.circular(5.0),
            border: Border.all(color: AppColors.lightGrey, width: 0.25)),
        child: SvgPicture.asset(
          iconPath,
          colorFilter: ColorFilter.mode(
            isSelected ? AppColors.white : AppColors.lightGrey,
            BlendMode.srcIn,
          ),
        ),
      ),
      title: Text(
        title,
        style: AppTextStyles.style16LightGrey400,
      ),
    );
  }
}
