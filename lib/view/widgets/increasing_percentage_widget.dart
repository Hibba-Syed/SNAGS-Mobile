import 'package:flutter/material.dart';
import 'package:iskaan_inspections_mobile/res/constants/app_colors.dart';
import 'package:iskaan_inspections_mobile/res/styles/styles.dart';
class IncreasingPercentageWidget extends StatelessWidget {
  final String value;
  const IncreasingPercentageWidget({super.key,required this.value});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Transform.rotate(
          angle: 100,
          child: const Icon(
            Icons.arrow_forward,
            color: AppColors.green,
            size: 14,
          ),
        ),
         Text(
          value,
          style: AppTextStyles.style12Green400,
        ),
      ],
    );
  }
}
