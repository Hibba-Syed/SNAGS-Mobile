import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:iskaan_inspections_mobile/res/styles/styles.dart';

import '../../../../res/constants/app_colors.dart';
import '../../../helper/ui_helper.dart';

class InspectionsContainer extends StatelessWidget {
  const InspectionsContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: const Border(
                    bottom: BorderSide(color: AppColors.yellow, width: 2),
                  ),
                ),
                child: const Column(
                  children: [
                    Text(
                      "1",
                      style: AppTextStyles.style24Grey600,
                    ),
                    Text(
                      "status",
                      style: AppTextStyles.style12Grey400,
                    ),
                  ],
                ),
              ),
            ),
            UIHelper.horizontalSpace(16.0),
            Expanded(
              child: Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: const Border(
                    bottom: BorderSide(color: AppColors.blue, width: 2),
                  ),
                ),
                child: const Column(
                  children: [
                    Text(
                      "1",
                      style: AppTextStyles.style24Grey600,
                    ),
                    Text(
                      "status",
                      style: AppTextStyles.style12Grey400,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Flexible(
              child: Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: const Border(
                    bottom: BorderSide(color: AppColors.green, width: 2),
                  ),
                ),
                child: const Column(
                  children: [
                    Text(
                      "1",
                      style: AppTextStyles.style24Grey600,
                    ),
                    Text(
                      "status",
                      style: AppTextStyles.style12Grey400,
                    ),
                  ],
                ),
              ),
            ),
            UIHelper.horizontalSpace(4),
            Flexible(
              child: Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: const Border(
                    bottom: BorderSide(color: AppColors.green, width: 2),
                  ),
                ),
                child: const Column(
                  children: [
                    Text(
                      "1",
                      style: AppTextStyles.style24Grey600,
                    ),
                    Text(
                      "status",
                      style: AppTextStyles.style12Grey400,
                    ),
                  ],
                ),
              ),
            ),
            UIHelper.horizontalSpace(4),
            Flexible(
              child: Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: const Border(
                    bottom: BorderSide(color: AppColors.red, width: 2),
                  ),
                ),
                child: const Column(
                  children: [
                    Text(
                      "1",
                      style: AppTextStyles.style24Grey600,
                    ),
                    Text(
                      "status",
                      style: AppTextStyles.style12Grey400,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
