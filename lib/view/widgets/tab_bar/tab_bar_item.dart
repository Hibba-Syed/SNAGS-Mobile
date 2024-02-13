import 'package:flutter/material.dart';
import 'package:iskaan_inspections_mobile/res/constants/app_colors.dart';
import 'package:iskaan_inspections_mobile/res/styles/styles.dart';

class TabBarItem extends StatelessWidget {
  final String title;
  final bool isSelected;
  const TabBarItem({
    super.key,
    required this.title,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 8.0),
      constraints: const BoxConstraints(
        minWidth: 110,
      ),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color:
        isSelected ? AppColors.primary : AppColors.primary.withOpacity(0.1),
        borderRadius: const BorderRadius.all(Radius.circular(10)),
      ),
      child: Text(
        title,
        style: isSelected
            ? AppTextStyles.style16White500
            : AppTextStyles.style16Primary400,
      ),
    );
  }
}
