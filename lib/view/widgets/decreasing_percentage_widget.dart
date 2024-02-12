import 'package:flutter/material.dart';
import 'package:iskaan_inspections_mobile/res/constants/app_colors.dart';
import 'package:iskaan_inspections_mobile/res/styles/styles.dart';

class DecreasingPercentageWidget extends StatelessWidget {
  final String value;
  const DecreasingPercentageWidget({super.key, required this.value});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Transform.rotate(
          angle: 70,
          child: const Icon(
            Icons.arrow_forward,
            color: AppColors.red,
            size: 14,
          ),
        ),
        Text(
          value,
          style: AppTextStyles.style12Red400,
        ),
      ],
    );
  }
}
