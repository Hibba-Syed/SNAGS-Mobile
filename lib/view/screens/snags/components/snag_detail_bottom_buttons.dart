import 'package:flutter/material.dart';
import 'package:iskaan_inspections_mobile/res/constants/app_colors.dart';
import 'package:iskaan_inspections_mobile/res/constants/constants.dart';
import 'package:iskaan_inspections_mobile/view/helper/ui_helper.dart';
import 'package:iskaan_inspections_mobile/view/widgets/button/custom_button.dart';
import 'package:iskaan_inspections_mobile/view/widgets/custom_loader.dart';

class SnagDetailBottomButtons extends StatelessWidget {
  final String status;
  final VoidCallback onStartPressed;
  final bool isStartLoading;
  final VoidCallback onCompletePressed;
  final bool isCompleteLoading;
  final VoidCallback onCancelPressed;
  final bool isCancelLoading;
  final VoidCallback onEditPressed;
  final VoidCallback onMergePressed;
  const SnagDetailBottomButtons({
    super.key,
    required this.status,
    required this.onStartPressed,
    this.isStartLoading = false,
    required this.onCompletePressed,
    this.isCompleteLoading = false,
    required this.onCancelPressed,
    this.isCancelLoading = false,
    required this.onEditPressed,
    required this.onMergePressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        children: [
          if (status == AppConstants.snagNew.title)
            Column(
              children: [
                isStartLoading
                    ? const CustomLoader()
                    : CustomButton(
                        icon: const Icon(
                          Icons.start,
                          color: AppColors.white,
                        ),
                        text: 'Start',
                        textColor: AppColors.white,
                        buttonColor: AppColors.green,
                        onPressed: onStartPressed,
                      ),
                UIHelper.verticalSpace(12.0),
              ],
            ),
          if (status == AppConstants.snagInProgress.title)
            Column(
              children: [
                Row(
                  children: [
                    Flexible(
                      child: isCompleteLoading
                          ? const CustomLoader()
                          : CustomButton(
                              icon: const Icon(
                                Icons.check,
                                color: AppColors.white,
                              ),
                              text: 'Complete',
                              textColor: AppColors.white,
                              buttonColor: AppColors.green,
                              onPressed: onCompletePressed,
                            ),
                    ),
                    UIHelper.horizontalSpace(10.0),
                    Flexible(
                      child: isCancelLoading
                          ? const CustomLoader()
                          : CustomButton(
                              icon: const Icon(
                                Icons.close,
                                color: AppColors.white,
                              ),
                              text: 'Cancel',
                              textColor: AppColors.white,
                              buttonColor: AppColors.red,
                              onPressed: onCancelPressed,
                            ),
                    ),
                  ],
                ),
                UIHelper.verticalSpace(12.0),
              ],
            ),
          Row(
            children: [
              if (status == AppConstants.snagNew.title)
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
              if (status == AppConstants.snagNew.title)
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
