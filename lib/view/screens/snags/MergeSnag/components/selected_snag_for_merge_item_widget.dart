import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:iskaan_inspections_mobile/res/constants/app_colors.dart';
import 'package:iskaan_inspections_mobile/res/styles/styles.dart';
import 'package:iskaan_inspections_mobile/view/helper/ui_helper.dart';
import 'package:iskaan_inspections_mobile/view/widgets/image/network_image_widget.dart';

class SelectedSnagForMergeItemWidget extends StatelessWidget {
  final String reference;
  final String title;
  final String description;
  final String createdAt;
  final List<String> imagesUrls;
  final VoidCallback onRemovePressed;
  const SelectedSnagForMergeItemWidget({
    super.key,
    required this.reference,
    required this.title,
    required this.description,
    required this.imagesUrls,
    required this.createdAt,
    required this.onRemovePressed,
  });

  @override
  Widget build(BuildContext context) {
    double deviceWidth = MediaQuery.of(context).size.width;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: deviceWidth / 5,
          height: 80,
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
                      height: 80.0,
                    );
                  }).toList(),
                )
              : NetworkImageWidget(
                  url: '',
                  width: deviceWidth / 5,
                  height: 80,
                ),
        ),
        UIHelper.horizontalSpace(10.0),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Container(
                height: 80.0,
                padding: const EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                    color: Colors.grey.shade100,
                    borderRadius: BorderRadius.circular(5.0)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      reference,
                      style: AppTextStyles.style14Grey600,
                    ),
                    UIHelper.verticalSpace(5.0),
                    Text(
                      title,
                      style: AppTextStyles.style12Grey400,
                      overflow: TextOverflow.ellipsis,
                    ),
                    UIHelper.verticalSpace(5.0),
                    Text(
                      description,
                      style: AppTextStyles.style12Grey400,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
              Text(
                'Created at: $createdAt',
                style: AppTextStyles.style10LightGrey400,
              )
            ],
          ),
        ),
        UIHelper.horizontalSpace(10.0),
        InkWell(
          onTap: onRemovePressed,
          child: Container(
            height: 80.0,
            padding: const EdgeInsets.symmetric(horizontal: 5.0),
            decoration: BoxDecoration(
                color: AppColors.red, borderRadius: BorderRadius.circular(6.0)),
            child: const Icon(
              Icons.remove,
              color: AppColors.white,
            ),
          ),
        ),
      ],
    );
  }
}
