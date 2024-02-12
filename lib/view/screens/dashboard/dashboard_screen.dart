import 'package:flutter/material.dart';
import 'package:iskaan_inspections_mobile/res/constants/app_colors.dart';
import 'package:iskaan_inspections_mobile/res/styles/styles.dart';
import 'package:iskaan_inspections_mobile/view/helper/ui_helper.dart';
import 'package:iskaan_inspections_mobile/view/screens/dashboard/components/high_risk_snags_container.dart';
import 'package:iskaan_inspections_mobile/view/screens/dashboard/components/pending_inspections_container.dart';
import 'package:iskaan_inspections_mobile/view/widgets/image/network_image_widget.dart';
import 'package:iskaan_inspections_mobile/view/widgets/row_title_and_view_more.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Row(
            children: [
              NetworkImageWidget(
                url: '',
                width: 46,
                height: 46,
                shape: BoxShape.circle,
                placeHolder: Container(
                  width: 46.0,
                  height: 46.0,
                  decoration: BoxDecoration(
                      color: Colors.grey.shade200, shape: BoxShape.circle),
                  child: const Icon(
                    Icons.person,
                    color: AppColors.grey,
                  ),
                ),
              ),
              UIHelper.horizontalSpace(10.0),
              const Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Welcome,',
                      style: AppTextStyles.style15LightGrey500,
                    ),
                    Flexible(
                        child: Text(
                      'Fatima Hameed Raza',
                      style: AppTextStyles.style20Grey600,
                    )),
                  ],
                ),
              ),
            ],
          ),
          UIHelper.verticalSpace(16.0),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: 120,
            child: ListView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.all(10.0),
              children: [
                PendingInspectionsContainer(),
                HighRiskSnagsContainer(),
              ],
            ),
          ),
          UIHelper.verticalSpace(10.0),
          RowTitleWithViewMore(
            text: 'Action Required',
            onViewMorePressed: () {},
          ),
        ],
      ),
    );
  }
}
