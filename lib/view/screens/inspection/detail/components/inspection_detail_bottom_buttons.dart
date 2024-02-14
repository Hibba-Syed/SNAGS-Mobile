import 'package:flutter/material.dart';
import 'package:iskaan_inspections_mobile/res/constants/app_colors.dart';
import 'package:iskaan_inspections_mobile/view/helper/ui_helper.dart';
import 'package:iskaan_inspections_mobile/view/widgets/button/custom_button.dart';

class InspectionDetailBottomButtons extends StatelessWidget {
  final VoidCallback onSubmitPressed;
  final VoidCallback onEditPressed;
  final VoidCallback onDeletePressed;
  const InspectionDetailBottomButtons({
    super.key,
    required this.onSubmitPressed,
    required this.onEditPressed,
    required this.onDeletePressed,
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
            text: 'Submit',
            textColor: AppColors.white,
            buttonColor: AppColors.green,
            onPressed: onSubmitPressed,
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
                    Icons.delete_outline,
                    color: AppColors.white,
                  ),
                  text: 'Delete',
                  textColor: AppColors.white,
                  buttonColor: AppColors.red,
                  onPressed: onDeletePressed,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
