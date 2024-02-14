import 'package:flutter/material.dart';
import 'package:iskaan_inspections_mobile/res/styles/styles.dart';
import 'package:iskaan_inspections_mobile/utils/validation_util.dart';
import 'package:iskaan_inspections_mobile/view/helper/ui_helper.dart';

class SnagDetailItemWidget extends StatelessWidget {
  final String title;
  final String? value;
  final Widget? widget;
  const SnagDetailItemWidget({
    super.key,
    required this.title,
    this.value,
    this.widget,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: AppTextStyles.style12LightGrey400,
          ),
          UIHelper.verticalSpace(4.0),
          Container(
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.all(5.0),
            decoration: BoxDecoration(
              color: Colors.grey.shade100,
              borderRadius: BorderRadius.circular(5.0),
            ),
            child: widget != null
                ? widget!
                : ValidationUtil.isValid(value)
                    ? Text(
                        value!,
                        style: AppTextStyles.style14Grey600,
                      )
                    : const SizedBox.shrink(),
          ),
        ],
      ),
    );
  }
}
