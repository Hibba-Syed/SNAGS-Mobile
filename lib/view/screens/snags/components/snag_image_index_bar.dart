import 'package:flutter/material.dart';
import 'package:iskaan_inspections_mobile/res/constants/app_colors.dart';
class SnagImageIndexBar extends StatelessWidget {
  final bool isSelected;
  const SnagImageIndexBar({super.key,required this.isSelected,});

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(
        maxWidth: 40.0,
        minHeight: 8.0,
      ),
      decoration: BoxDecoration(
          color: isSelected?AppColors.primary:AppColors.lightGrey,
          borderRadius: BorderRadius.circular(5.0)
      ),
    );
  }
}
