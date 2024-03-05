import 'package:flutter/material.dart';
import 'package:iskaan_inspections_mobile/res/constants/app_colors.dart';
import 'package:iskaan_inspections_mobile/res/styles/styles.dart';
import 'package:iskaan_inspections_mobile/utils/date_time.dart';
import 'package:iskaan_inspections_mobile/view/helper/ui_helper.dart';
import 'package:iskaan_inspections_mobile/view/widgets/image/network_image_widget.dart';

class LogWidget extends StatelessWidget {
  final String? description;
  final String? loggerName;
  final String? date;
  final String? loggerImageUrl;
  const LogWidget({
    super.key,
    required this.description,
    required this.loggerName,
    required this.date,
    required this.loggerImageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          NetworkImageWidget(
            width: 40.0,
            height: 40.0,
            url: loggerImageUrl,
            shape: BoxShape.circle,
            placeHolder: const Icon(
              Icons.person,
              color: AppColors.grey,
            ),
          ),
          UIHelper.horizontalSpace(10.0),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(
                  text: TextSpan(
                    text: description ?? '--',
                    style: AppTextStyles.style12Grey400,
                    children: [
                      TextSpan(
                          text: ' ${loggerName ?? '--'}',
                          style: AppTextStyles.style14Primary600),
                    ],
                  ),
                ),
                UIHelper.verticalSpace(5.0),
                Text(
                  DateTimeUtil.getFormattedDateTime(date),
                  style: AppTextStyles.style12LightGrey400,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
