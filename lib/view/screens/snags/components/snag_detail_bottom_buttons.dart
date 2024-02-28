import 'package:flutter/material.dart';
import 'package:iskaan_inspections_mobile/res/constants/app_colors.dart';
import 'package:iskaan_inspections_mobile/view/helper/ui_helper.dart';
import 'package:iskaan_inspections_mobile/view/widgets/button/custom_button.dart';

class SnagDetailBottomButtons extends StatelessWidget {
  final VoidCallback onStartPressed;
  final VoidCallback onEditPressed;
  final VoidCallback onMergePressed;
  const SnagDetailBottomButtons({
    super.key,
    required this.onStartPressed,
    required this.onEditPressed,
    required this.onMergePressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        children: [
          CustomButton(
            icon: const Icon(
              Icons.send,
              color: AppColors.white,
            ),
            text: 'Start',
            textColor: AppColors.white,
            buttonColor: AppColors.green,
            onPressed: onStartPressed,
          ),
          UIHelper.verticalSpace(12.0),
          Row(
            children: [
              Flexible(
                child: CustomButton(
                  icon: const Icon(
                    Icons.note_alt_outlined,
                    color: AppColors.white,
                  ),
                  text: 'Edit',
                  textColor: AppColors.white,
                  buttonColor: AppColors.yellow,
                  onPressed: onEditPressed,
                ),
              ),
              UIHelper.horizontalSpace(10.0),
              Flexible(
                child: CustomButton(
                  icon: const Icon(
                    Icons.merge,
                    color: AppColors.white,
                  ),
                  text: 'Merge',
                  textColor: AppColors.white,
                  buttonColor: AppColors.primary,
                  onPressed: onMergePressed,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
