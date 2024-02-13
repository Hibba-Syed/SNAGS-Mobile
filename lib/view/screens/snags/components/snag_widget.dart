import 'package:flutter/material.dart';
import 'package:iskaan_inspections_mobile/res/constants/app_colors.dart';
import 'package:iskaan_inspections_mobile/res/styles/styles.dart';
import 'package:iskaan_inspections_mobile/view/helper/ui_helper.dart';
import 'package:iskaan_inspections_mobile/view/widgets/risk_widget.dart';
import 'package:iskaan_inspections_mobile/view/widgets/status_widget.dart';

class SnagWidget extends StatelessWidget {
  final String? imageUrl;
  final String risk;
  final String status;
  final String reference;
  final String title;
  final String description;
  final VoidCallback onTap;
  const SnagWidget({
    super.key,
    required this.imageUrl,
    required this.risk,
    required this.status,
    required this.reference,
    required this.title,
    required this.description,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    double deviceWidth = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: deviceWidth,
        height: 120,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(10.0),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade300,
              blurRadius: 3,
            ),
          ],
        ),
        child: Row(
          children: [
            Image.network(
              imageUrl ?? '',
              width: deviceWidth / 3,
              height: 120,
              fit: BoxFit.fill,
              errorBuilder: (context, obj, trace) {
                return Container(
                  width: deviceWidth / 3,
                  height: 120,
                  color: Colors.grey.shade300,
                  child: const Icon(
                    Icons.image_outlined,
                    color: AppColors.grey,
                  ),
                );
              },
            ),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        RiskWidget(
                          risk: risk,
                          color: AppColors.red,
                        ),
                        StatusWidget(
                          status: status,
                          color: AppColors.yellow,
                        ),
                      ],
                    ),
                    UIHelper.verticalSpace(6.0),
                    Text(
                      reference,
                      style: AppTextStyles.style16DarkGrey600,
                    ),
                    UIHelper.verticalSpace(5.0),
                    Text(
                      title,
                      style: AppTextStyles.style14LightGrey500,
                    ),
                    UIHelper.verticalSpace(3.0),
                    Text(
                      description,
                      style: AppTextStyles.style12LightGrey400,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
