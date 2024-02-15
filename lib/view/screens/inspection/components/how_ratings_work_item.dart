import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:iskaan_inspections_mobile/res/constants/app_colors.dart';
import 'package:iskaan_inspections_mobile/res/styles/styles.dart';

class HowRatingsWorkItem extends StatelessWidget {
  final Color ratingColor;
  final String text;
  final Color naBackgroundColor;
  final Color naTextColor;
  const HowRatingsWorkItem({
    super.key,
    this.ratingColor = AppColors.red,
    required this.text,
    this.naTextColor = AppColors.red,
    this.naBackgroundColor = AppColors.white,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          RatingBarIndicator(
            unratedColor: ratingColor,
            itemSize: 20,
            itemBuilder: (context, index) {
              return const Icon(
                Icons.star_outline,
              );
            },
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 5.0),
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 5.0),
            decoration: BoxDecoration(
                color: naBackgroundColor,
                borderRadius: BorderRadius.circular(5.0),
                border: Border.all(
                  color: AppColors.red,
                )),
            child: Text(
              'NA',
              style: TextStyle(
                color: naTextColor,
                fontSize: 10.0,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
           Text(
            text,
            style: AppTextStyles.style12Grey400,
          ),
        ],
      ),
    );
  }
}
