import 'package:flutter/material.dart';
import 'package:iskaan_inspections_mobile/res/constants/app_colors.dart';
import 'package:iskaan_inspections_mobile/res/styles/styles.dart';
import 'package:iskaan_inspections_mobile/view/helper/ui_helper.dart';
import 'package:iskaan_inspections_mobile/view/widgets/date_text_widget.dart';
import 'package:iskaan_inspections_mobile/view/widgets/status/inspection_status_widget.dart';

class InspectionDetailLogsItemWidget extends StatelessWidget {
  final String text;
  final String by;
  final String status;
  final String date;

  const InspectionDetailLogsItemWidget({
    super.key,
    required this.text,
    required this.by,
    required this.status,
    required this.date,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(10.0),

      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.all(5.0),
            decoration: BoxDecoration(
              color: Colors.grey.shade100,
              borderRadius: BorderRadius.circular(5.0),
            ),
            child: RichText(
              text: TextSpan(
                text: text,
                style: AppTextStyles.style14Grey400,
                children: [
                  TextSpan(text: ' $by', style: AppTextStyles.style14Primary600),
                ],
              ),
            ),
          ),
          UIHelper.verticalSpace(8.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InspectionStatusWidget(status: status,),
              DateTextWidget(
                date: date,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
