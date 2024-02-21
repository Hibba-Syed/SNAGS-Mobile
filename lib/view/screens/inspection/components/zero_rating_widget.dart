import 'package:flutter/material.dart';
import 'package:iskaan_inspections_mobile/res/constants/app_colors.dart';
import 'package:iskaan_inspections_mobile/res/styles/styles.dart';

class ZeroRatingButton extends StatelessWidget {
  final VoidCallback onTap;
  const ZeroRatingButton({
    super.key,
    required this.onTap,
  });
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(right: 8.0),
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 3.0),
        decoration: BoxDecoration(
          color: Colors.grey.shade200,
          borderRadius: BorderRadius.circular(5.0),
        ),
        child: Text(
          'Zero',
          style: AppTextStyles.style12Grey400,
        ),
      ),
    );
  }
}
