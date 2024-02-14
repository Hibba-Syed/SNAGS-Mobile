import 'package:flutter/material.dart';
import 'package:iskaan_inspections_mobile/res/constants/app_colors.dart';
import 'package:iskaan_inspections_mobile/res/styles/styles.dart';
import 'package:iskaan_inspections_mobile/view/helper/ui_helper.dart';
class RowTextWithRating extends StatelessWidget {
  final String text;
  final double? rating;
  const RowTextWithRating({super.key,required this.text,required this.rating,});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            padding: const EdgeInsets.all(5.0),
            decoration: BoxDecoration(
              color: Colors.grey.shade100,
              borderRadius: BorderRadius.circular(5.0),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Icon(
                  Icons.verified_outlined,
                  color: AppColors.primary,
                  size: 18,
                ),
                UIHelper.horizontalSpace(5.0),
                Flexible(
                  child: Text(
                    text,
                    style: AppTextStyles.style14Grey400,
                  ),
                ),
              ],
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.only(left: 5.0),
          padding: const EdgeInsets.symmetric(
              horizontal: 8.0, vertical: 6.5),
          decoration: BoxDecoration(
            color: Colors.grey.shade100,
            borderRadius: BorderRadius.circular(5.0),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                rating!=null?rating.toString():'N/A',
                style: AppTextStyles.style12Grey400,
              ),
              if(rating!=null)
              const Icon(
                Icons.star,
                color: AppColors.primary,
                size: 12,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
