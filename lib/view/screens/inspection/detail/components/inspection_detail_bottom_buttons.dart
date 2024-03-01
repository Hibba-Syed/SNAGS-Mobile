import 'package:flutter/material.dart';
import 'package:iskaan_inspections_mobile/res/constants/app_colors.dart';
import 'package:iskaan_inspections_mobile/res/constants/constants.dart';
import 'package:iskaan_inspections_mobile/res/styles/styles.dart';
import 'package:iskaan_inspections_mobile/view/helper/ui_helper.dart';
import 'package:iskaan_inspections_mobile/view/widgets/button/custom_button.dart';

class InspectionDetailBottomButtons extends StatelessWidget {
  final String status;
  final VoidCallback onSubmitPressed;
  final VoidCallback onEditPressed;
  final VoidCallback onArchivePressed;
  const InspectionDetailBottomButtons({
    super.key,
    required this.status,
    required this.onSubmitPressed,
    required this.onEditPressed,
    required this.onArchivePressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        children: [
          if (status == AppConstants.inspectionInProgress.title)
            Column(
              children: [
                CustomButton(
                  icon: const Icon(
                    Icons.send,
                    color: AppColors.white,
                  ),
                  text: 'Submit',
                  textColor: AppColors.white,
                  buttonColor: AppColors.green,
                  onPressed: () {
                    _showSubmitDialog(context);
                  },
                ),
                UIHelper.verticalSpace(12.0),
              ],
            ),
          Row(
            children: [
              if (status == AppConstants.inspectionInProgress.title ||
                  status == AppConstants.inspectionReadyForSubmission.title ||
                  status == AppConstants.inspectionRejected.title)
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
              if (status == AppConstants.inspectionInProgress.title ||
                  status == AppConstants.inspectionReadyForSubmission.title ||
                  status == AppConstants.inspectionRejected.title)
                UIHelper.horizontalSpace(10.0),
              if (status == AppConstants.inspectionInProgress.title ||
                  status == AppConstants.inspectionReadyForSubmission.title ||
                  status == AppConstants.inspectionRejected.title)
                Flexible(
                  child: CustomButton(
                    icon: const Icon(
                      Icons.archive,
                      color: AppColors.white,
                    ),
                    text: 'Archive',
                    textColor: AppColors.white,
                    buttonColor: AppColors.red,
                    onPressed: (){
                      _showArchiveDialog(context);
                    },
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }

  _showSubmitDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: AppColors.white,
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(
                Icons.info_outline,
                color: AppColors.primary,
                size: 50,
              ),
              UIHelper.verticalSpace(16.0),
              const Text(
                'Are you sure you want to submit this inspection report to the community managers for review?',
                style: AppTextStyles.style16Grey600,
              ),
              UIHelper.verticalSpace(10.0),
              const Text(
                '* you will not be able to do any change on the inspection after submitting.',
                style: AppTextStyles.style14LightGrey400,
              ),
              UIHelper.verticalSpace(10.0),
              Row(
                children: [
                  Flexible(
                    child: CustomButton(
                      text: 'Submit',
                      onPressed: () {
                        Navigator.pop(context);
                        onSubmitPressed();
                      },
                    ),
                  ),
                  UIHelper.horizontalSpace(10.0),
                  Flexible(
                    child: CustomButton(
                      text: 'Cancel',
                      invert: true,
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
  _showArchiveDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: AppColors.white,
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(
                Icons.info_outline,
                color: AppColors.primary,
                size: 50,
              ),
              UIHelper.verticalSpace(16.0),
              const Text(
                'Are you sure you want to archive this inspection report?',
                style: AppTextStyles.style16Grey600,
              ),
              UIHelper.verticalSpace(10.0),
              const Text(
                '* you will not be able to do any change on the inspection after submitting.',
                style: AppTextStyles.style14LightGrey400,
              ),
              UIHelper.verticalSpace(10.0),
              Row(
                children: [
                  Flexible(
                    child: CustomButton(
                      text: 'Archive',
                      onPressed: () {
                        Navigator.pop(context);
                        onArchivePressed();
                      },
                    ),
                  ),
                  UIHelper.horizontalSpace(10.0),
                  Flexible(
                    child: CustomButton(
                      text: 'Cancel',
                      invert: true,
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
