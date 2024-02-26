import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:iskaan_inspections_mobile/bloc/dashboard/dashboard_cubit.dart';
import 'package:iskaan_inspections_mobile/bloc/main_dashboard/main_dashboard_cubit.dart';
import 'package:iskaan_inspections_mobile/model/inspection/inspections_response_model.dart';
import 'package:iskaan_inspections_mobile/model/snag/snags_response_model.dart';
import 'package:iskaan_inspections_mobile/res/constants/app_colors.dart';
import 'package:iskaan_inspections_mobile/res/constants/constants.dart';
import 'package:iskaan_inspections_mobile/res/constants/images.dart';
import 'package:iskaan_inspections_mobile/res/styles/styles.dart';
import 'package:iskaan_inspections_mobile/utils/routes/app_routes.dart';
import 'package:iskaan_inspections_mobile/view/helper/ui_helper.dart';
import 'package:iskaan_inspections_mobile/view/screens/dashboard/components/action_required_item_widget.dart';
import 'package:iskaan_inspections_mobile/view/screens/dashboard/components/high_risk_snags_container.dart';
import 'package:iskaan_inspections_mobile/view/screens/dashboard/components/pending_inspections_container.dart';
import 'package:iskaan_inspections_mobile/view/screens/dashboard/components/recent_inspection_item_widget.dart';
import 'package:iskaan_inspections_mobile/view/screens/dashboard/components/total_communities_container.dart';
import 'package:iskaan_inspections_mobile/view/screens/snags/components/snag_widget.dart';
import 'package:iskaan_inspections_mobile/view/widgets/button/add_button.dart';
import 'package:iskaan_inspections_mobile/view/widgets/button/custom_button.dart';
import 'package:iskaan_inspections_mobile/view/widgets/custom_loader.dart';
import 'package:iskaan_inspections_mobile/view/widgets/empty_widget.dart';
import 'package:iskaan_inspections_mobile/view/widgets/image/network_image_widget.dart';
import 'package:iskaan_inspections_mobile/view/widgets/row_title_and_view_more.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<DashboardCubit, DashboardState>(
        builder: (context, state) {
          if (state.isLoading == true) {
            return const CustomLoader();
          }
          return SingleChildScrollView(
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
            child: Column(
              children: [
                Row(
                  children: [
                    NetworkImageWidget(
                      url: state.profileRecord?.profilePicture,
                      width: 46,
                      height: 46,
                      shape: BoxShape.circle,
                      placeHolder: Container(
                        width: 46.0,
                        height: 46.0,
                        decoration: BoxDecoration(
                            color: Colors.grey.shade200,
                            shape: BoxShape.circle),
                        child: const Icon(
                          Icons.person,
                          color: AppColors.grey,
                        ),
                      ),
                    ),
                    UIHelper.horizontalSpace(10.0),
                    Expanded(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Welcome,',
                            style: AppTextStyles.style15LightGrey500,
                          ),
                          Flexible(
                            child: Text(
                              state.profileRecord?.fullName ?? '--',
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
                _recentInspectionsView(context,state),
                UIHelper.verticalSpace(10.0),
                _recentSnagsView(context,state),
              ],
            ),
          );
        },
      ),
      floatingActionButton: BlocBuilder<DashboardCubit, DashboardState>(
        builder: (context, state) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              if (state.isFloatingButtonExpanded)
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      CustomButton(
                        icon: SvgPicture.asset(
                          AppImages.icInspection,
                          colorFilter: const ColorFilter.mode(
                              AppColors.white, BlendMode.srcIn),
                        ),
                        buttonColor: AppColors.cGreen,
                        text: 'Add Inspection',
                        onPressed: () {
                          Navigator.pushNamed(context, AppRoutes.addInspection);
                          context
                              .read<DashboardCubit>()
                              .onChangeIsFloatingButtonExpanded(false);
                        },
                      ),
                      UIHelper.verticalSpace(10.0),
                      CustomButton(
                        icon: SvgPicture.asset(AppImages.icSnags,
                            colorFilter: const ColorFilter.mode(
                                AppColors.white, BlendMode.srcIn)),
                        text: 'Add Snags',
                        buttonColor: AppColors.mayaBlue,
                        onPressed: () {
                          Navigator.pushNamed(context, AppRoutes.addSnag);
                          context
                              .read<DashboardCubit>()
                              .onChangeIsFloatingButtonExpanded(false);
                        },
                      ),
                    ],
                  ),
                ),
              if (state.isFloatingButtonExpanded)
                UIHelper.horizontalSpace(10.0),
              Flexible(
                child: AddButton(
                  iconData:
                      state.isFloatingButtonExpanded ? Icons.remove : null,
                  onTap: () {
                    context
                        .read<DashboardCubit>()
                        .onChangeIsFloatingButtonExpanded(
                            !state.isFloatingButtonExpanded);
                  },
                ),
              ),
            ],
          );
        },
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

  _recentInspectionsView(BuildContext context, DashboardState state) {
    return Column(
      children: [
        RowTitleWithViewMore(
          text: 'Recent Inspections',
          onViewMorePressed: () {
            context
                .read<MainDashboardCubit>()
                .onChangeSelectedIndex(context,AppConstants.inspectionIndex);
          },
        ),
        state.recentInspections?.isNotEmpty ?? false
            ? ListView.separated(
                itemCount: state.recentInspections?.length ?? 0,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  InspectionModel item = state.recentInspections![index];
                  return RecentInspectionItemWidget(
                    reference: item.reference??'--',
                    status: item.status??'--',
                    communityName: item.association?.name??'--',
                    userName: item.inspector?.fullName??'--',
                    date: item.updatedAt??item.createdAt,
                    onTap: () {
                      Navigator.pushNamed(context, AppRoutes.inspectionDetail);
                    },
                  );
                },
                separatorBuilder: (context, index) {
                  return UIHelper.verticalSpace(8.0);
                },
              )
            : const EmptyWidget(
                text: 'No Inspections found',
              ),
      ],
    );
  }

  _recentSnagsView(BuildContext context,DashboardState state) {
    return Column(
      children: [
        RowTitleWithViewMore(
          text: 'Recent Snags',
          onViewMorePressed: () {
            context
                .read<MainDashboardCubit>()
                .onChangeSelectedIndex(context,AppConstants.snagsIndex);
          },
        ),
        state.recentSnags?.isNotEmpty??false?
        ListView.separated(
          itemCount: state.recentSnags?.length??0,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            SnagModel item = state.recentSnags![index];
            return SnagWidget(
              reference: item.reference??'--',
              status: item.status??'--',
              risk: item.risk??'--',
              title: item.title??'--',
              imageUrl: '',
              description:item.description??'--',
              onTap: () {
                Navigator.pushNamed(context, AppRoutes.snagDetail);
              },
            );
          },
          separatorBuilder: (context, index) {
            return UIHelper.verticalSpace(8.0);
          },
        ):const EmptyWidget(text: 'No Snags found',),
      ],
    );
  }
}
