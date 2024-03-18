import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:iskaan_inspections_mobile/res/constants/app_colors.dart';
import 'package:iskaan_inspections_mobile/res/styles/styles.dart';
import 'package:iskaan_inspections_mobile/utils/date_time.dart';
import 'package:iskaan_inspections_mobile/view/helper/ui_helper.dart';
import 'package:iskaan_inspections_mobile/view/widgets/image/network_image_widget.dart';

class SnagToMergeItemWidget extends StatelessWidget {
  final String reference;
  final String? createdAt;
  final String title;
  final List<String> imagesUrls;
  final VoidCallback onAddPressed;
  const SnagToMergeItemWidget({
    super.key,
    required this.reference,
    required this.createdAt,
    required this.title,
    required this.imagesUrls,
    required this.onAddPressed,
  });

  @override
  Widget build(BuildContext context) {
    double deviceWidth = MediaQuery.of(context).size.width;
    return Animate(
      effects: const [FadeEffect(), SlideEffect()],
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: deviceWidth / 5,
            height: 70,
            clipBehavior: Clip.antiAliasWithSaveLayer,
            decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(5.0)),
            child: (imagesUrls.isNotEmpty)
                ? CarouselSlider(
                    options: CarouselOptions(
                      autoPlay: true,
                      viewportFraction: 1,
                    ),
                    items: imagesUrls.map((i) {
                      return NetworkImageWidget(
                        url: i,
                        width: deviceWidth / 5,
                        height: 70.0,
                      );
                    }).toList(),
                  )
                : NetworkImageWidget(
                    url: '',
                    width: deviceWidth / 5,
                    height: 70,
                  ),
          ),
          UIHelper.horizontalSpace(10.0),
          Expanded(
            child: Container(
              height: 70.0,
              padding: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(5.0)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        reference,
                        style: AppTextStyles.style14Grey600,
                      ),
                      UIHelper.horizontalSpace(5.0),
                      Flexible(
                        child: Text(
                          title,
                          style: AppTextStyles.style12Grey400,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                  UIHelper.verticalSpace(5.0),
                  Text(
                    'Created at: ${DateTimeUtil.getFormattedDateTime(createdAt)}',
                    style: AppTextStyles.style10LightGrey400,
                  ),
                ],
              ),
            ),
          ),
          UIHelper.horizontalSpace(10.0),
          InkWell(
            onTap: onAddPressed,
            child: Container(
              height: 70.0,
              padding: const EdgeInsets.symmetric(horizontal: 5.0),
              decoration: BoxDecoration(
                  color: AppColors.green,
                  borderRadius: BorderRadius.circular(6.0)),
              child: const Icon(
                Icons.add,
                color: AppColors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
