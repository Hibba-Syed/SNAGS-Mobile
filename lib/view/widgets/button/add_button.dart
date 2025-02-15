import 'package:flutter/material.dart';
import 'package:iskaan_inspections_mobile/res/constants/app_colors.dart';


class AddButton extends StatelessWidget {
  final VoidCallback onTap;
  final IconData? iconData;
  const AddButton({
    super.key,
    required this.onTap,
    this.iconData,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(16.0),
        decoration: const BoxDecoration(
            color: AppColors.primary,
            borderRadius: BorderRadius.all(Radius.circular(20))),
        child:  Icon(
          iconData??Icons.add,
          color: AppColors.white,
          size: 26,
        ),
      ),
    );
  }
}
