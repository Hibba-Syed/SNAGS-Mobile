import 'package:flutter/material.dart';
import 'package:iskaan_inspections_mobile/res/constants/app_colors.dart';
import 'package:iskaan_inspections_mobile/res/styles/styles.dart';

class AddButtonWithTitle extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  const AddButtonWithTitle({
    super.key,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 6.0),
      decoration: const BoxDecoration(
        color: AppColors.primary,
        borderRadius: BorderRadius.all(
          Radius.circular(8),
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(
            Icons.add,
            color: AppColors.white,
            size: 22,
          ),
          Text(
            title,
            style: AppTextStyles.style18White400,
          )
        ],
      ),
    );
  }
}
