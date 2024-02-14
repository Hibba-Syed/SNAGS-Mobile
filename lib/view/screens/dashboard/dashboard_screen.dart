import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iskaan_inspections_mobile/bloc/main_dashboard/main_dashboard_cubit.dart';
import 'package:iskaan_inspections_mobile/res/constants/app_colors.dart';
import 'package:iskaan_inspections_mobile/res/constants/constants.dart';
import 'package:iskaan_inspections_mobile/res/styles/app_styles.dart';
import 'package:iskaan_inspections_mobile/res/styles/styles.dart';
import 'package:iskaan_inspections_mobile/utils/routes/app_routes.dart';
import 'package:iskaan_inspections_mobile/view/helper/ui_helper.dart';
import 'package:iskaan_inspections_mobile/view/screens/dashboard/components/action_required_item_widget.dart';
import 'package:iskaan_inspections_mobile/view/screens/dashboard/components/high_risk_snags_container.dart';
import 'package:iskaan_inspections_mobile/view/screens/dashboard/components/pending_inspections_container.dart';
import 'package:iskaan_inspections_mobile/view/screens/dashboard/components/recent_inspection_item_widget.dart';
import 'package:iskaan_inspections_mobile/view/screens/dashboard/components/recent_snags_item_widget.dart';
import 'package:iskaan_inspections_mobile/view/screens/dashboard/components/total_communities_container.dart';
import 'package:iskaan_inspections_mobile/view/widgets/button/add_button.dart';
import 'package:iskaan_inspections_mobile/view/widgets/image/network_image_widget.dart';
import 'package:iskaan_inspections_mobile/view/widgets/row_title_and_view_more.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
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
                        ),
                      ),
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
                  TotalCommunitiesContainer(),
                ],
              ),
            ),
            _actionRequiredView(),
            UIHelper.verticalSpace(10.0),
            _recentInspectionsView(context),
            UIHelper.verticalSpace(10.0),
            _recentSnagsView(context),
          ],
        ),
      ),
      floatingActionButton: AddButton(
        onTap: () {},
      ),
    );
  }

  _actionRequiredView() {
    return Column(
      children: [
        RowTitleWithViewMore(
          text: 'Action Required',
          onViewMorePressed: () {},
        ),
        Container(
          padding: const EdgeInsets.all(10.0),
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(10.0),

          ),
          child: ListView.separated(
            itemCount: 3,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return ActionRequiredItemWidget(
                count: 5,
                isInspection: true,
                status: 'Ready for Submission',
                onTap: () {},
              );
            },
            separatorBuilder: (context, index) {
              return UIHelper.verticalSpace(5.0);
            },
          ),
        ),
      ],
    );
  }

  _recentInspectionsView(BuildContext context) {
    return Column(
      children: [
        RowTitleWithViewMore(
          text: 'Recent Inspections',
          onViewMorePressed: () {
            context.read<MainDashboardCubit>().onChangeSelectedIndex(AppConstants.inspectionIndex);
          },
        ),
        ListView.separated(
          itemCount: 3,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            return RecentInspectionItemWidget(
              reference: 'INS001-24-00003',
              status: 'In-Progress',
              communityName: 'Al Attar Business Tower',
              userName: 'Muhammad Talha Al Mehri',
              date: 'May 08, 2023',
              onTap: () {
                Navigator.pushNamed(context, AppRoutes.inspectionDetail);
              },
            );
          },
          separatorBuilder: (context, index) {
            return UIHelper.verticalSpace(8.0);
          },
        ),
      ],
    );
  }

  _recentSnagsView(BuildContext context) {
    return Column(
      children: [
        RowTitleWithViewMore(
          text: 'Recent Snags',
          onViewMorePressed: () {
            context.read<MainDashboardCubit>().onChangeSelectedIndex(AppConstants.snagsIndex);

          },
        ),
        ListView.separated(
          itemCount: 3,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            return RecentSnagsItemWidget(
              reference: 'INS001-24-00003',
              status: 'In-Progress',
              risk: 'Low Risk',
              communityName: 'Al Attar Business Tower',
              userName: 'Muhammad Talha Al Mehri',
              date: 'May 08, 2023',
              onTap: () {
                Navigator.pushNamed(context, AppRoutes.snagDetail);
              },
            );
          },
          separatorBuilder: (context, index) {
            return UIHelper.verticalSpace(8.0);
          },
        ),
      ],
    );
  }
}
