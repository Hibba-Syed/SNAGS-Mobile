import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:iskaan_inspections_mobile/bloc/dashboard/dashboard_cubit.dart';
import 'package:iskaan_inspections_mobile/bloc/inspection/add_edit/add_edit_inspection_cubit.dart';
import 'package:iskaan_inspections_mobile/bloc/main_dashboard/main_dashboard_cubit.dart';
import 'package:iskaan_inspections_mobile/bloc/snags/snag_detail/snag_detail_cubit.dart';
import 'package:iskaan_inspections_mobile/model/inspection/inspections_response_model.dart';
import 'package:iskaan_inspections_mobile/model/snag/snag_model.dart';
import 'package:iskaan_inspections_mobile/res/constants/app_colors.dart';
import 'package:iskaan_inspections_mobile/res/constants/constants.dart';
import 'package:iskaan_inspections_mobile/res/constants/images.dart';
import 'package:iskaan_inspections_mobile/res/styles/styles.dart';
import 'package:iskaan_inspections_mobile/utils/routes/app_routes.dart';
import 'package:iskaan_inspections_mobile/view/helper/ui_helper.dart';
import 'package:iskaan_inspections_mobile/view/screens/dashboard/components/active_snags_container.dart';
import 'package:iskaan_inspections_mobile/view/screens/dashboard/components/active_inspections_container.dart';
import 'package:iskaan_inspections_mobile/view/screens/dashboard/components/recent_inspection_item_widget.dart';
import 'package:iskaan_inspections_mobile/view/screens/snags/components/snag_widget.dart';
import 'package:iskaan_inspections_mobile/view/widgets/button/add_button.dart';
import 'package:iskaan_inspections_mobile/view/widgets/button/custom_button.dart';
import 'package:iskaan_inspections_mobile/view/widgets/custom_loader.dart';
import 'package:iskaan_inspections_mobile/view/widgets/empty_widget.dart';
import 'package:iskaan_inspections_mobile/view/widgets/image/network_image_widget.dart';
import 'package:iskaan_inspections_mobile/view/widgets/row_title_and_view_more.dart';
import 'package:iskaan_inspections_mobile/view/widgets/snags_status_container.dart';

import '../../../model/month_filter_model.dart';
import '../../widgets/dropdown/dropdown_widget.dart';
import '../../widgets/inspactions_status_container.dart';

class DashboardScreen extends StatelessWidget {
  DashboardScreen({super.key});
  MonthFilterModel _selectInspectionMonth =
      MonthFilterModel(title: "1Y", value: 12);
  MonthFilterModel _selectSnagsMonth =
      MonthFilterModel(title: "1Y", value: 12);
 // bool _isLoading = false;
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
                      ActiveInspectionsContainer(),
                      ActiveSnagsContainer(),
                    ],
                  ),
                ),
                _snagsAndInspectionsView(context, state),
                _recentInspectionsView(context, state),
                UIHelper.verticalSpace(10.0),
                _recentSnagsView(context, state),
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
                          context
                              .read<DashboardCubit>()
                              .onChangeIsFloatingButtonExpanded(false);
                          context.read<AddEditInspectionCubit>().clearData();
                          Navigator.pushNamed(context, AppRoutes.addInspection)
                              .then((value) {
                            if (value == true) {
                              context
                                  .read<DashboardCubit>()
                                  .getRecentInspections();
                            }
                          });
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

  _snagsAndInspectionsView(BuildContext context, DashboardState state) {
    return SizedBox(
      height: 220,
      child: ListView(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        children: [
          Container(
            width: MediaQuery.of(context).size.width - 50,
            padding: const EdgeInsets.all(10.0),
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "${state.inspectionsStatistics?.inspectionReportsCount ?? 0}",
                          style: AppTextStyles.style24Grey600,
                        ),
                        const Text(
                          "Total Inspections",
                          style: AppTextStyles.style15Grey400,
                        ),
                      ],
                    ),
                    // const Spacer(),
                    Container(
                      height: 48,
                      width: 130,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: DropdownWidget<MonthFilterModel>(
                        hint: "Select",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(
                              width: 0.0, color: Colors.transparent),
                        ),
                        fillColor: AppColors.darkGrey.withOpacity(0.1),
                        icon: const Icon(Icons.keyboard_arrow_down_outlined),
                        selectedItem: _selectInspectionMonth,
                        itemAsString: (month) => month.title ?? '',
                        compareFn: (p0, p1) => p0.title == p1.title,
                        items: AppConstants.totalInspectionList,
                        onChanged: (item) {
                          if (item != null) {
                            _selectInspectionMonth = item;
                            context
                                .read<DashboardCubit>()
                                .getInspectionsStatistics(
                                    months: item.value);
                          }
                        },
                      ),
                    ),
                  ],
                ),
                Divider(
                  color: AppColors.darkGrey.withOpacity(0.1),
                ),
                Row(
                  children: [
                    InspectionsStatusContainer(
                      status: AppConstants.inspectionInProgress.title,
                      count: state.inspectionsStatistics
                              ?.newInspectionReportsCount ??
                          0,
                      onTap: () {},
                    ),
                    UIHelper.horizontalSpace(16.0),
                    InspectionsStatusContainer(
                      status: AppConstants.inspectionReadyForSubmission.title,
                      count: state.inspectionsStatistics
                              ?.newInspectionReportsCount ??
                          0,
                      onTap: () {},
                    ),
                  ],
                ),
                UIHelper.verticalSpace(16.0),
                Row(
                  children: [
                    InspectionsStatusContainer(
                      status: AppConstants.inspectionSubmitted.title,
                      count: state.inspectionsStatistics
                              ?.submittedInspectionReportsCount ??
                          0,
                      onTap: () {},
                    ),
                    UIHelper.horizontalSpace(16.0),
                    InspectionsStatusContainer(
                      status: AppConstants.inspectionApproved.title,
                      count: state.inspectionsStatistics
                              ?.approvedInspectionReportsCount ??
                          0,
                      onTap: () {},
                    ),
                    UIHelper.horizontalSpace(16.0),
                    InspectionsStatusContainer(
                      status: AppConstants.inspectionRejected.title,
                      count: state.inspectionsStatistics
                              ?.rejectedInspectionReportsCount ??
                          0,
                      onTap: () {},
                    ),
                  ],
                ),
              ],
            ),
          ),
          UIHelper.horizontalSpace(10.0),
          Container(
            width: MediaQuery.of(context).size.width - 50,
            padding: const EdgeInsets.all(10.0),
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "${state.snagsStatistics?.snagsCount ?? 0}",
                          style: AppTextStyles.style24Grey600,
                        ),
                        const Text(
                          "Total Snags",
                          style: AppTextStyles.style15Grey400,
                        ),
                      ],
                    ),
                    Container(
                      height: 48,
                      width: 130,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: DropdownWidget<MonthFilterModel>(
                        hint: "select",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(
                              width: 0.0, color: Colors.transparent),
                        ),
                        fillColor: AppColors.darkGrey.withOpacity(0.1),
                        icon: const Icon(Icons.keyboard_arrow_down_outlined),
                        items: AppConstants.totalInspectionList,
                        itemAsString: (month) => month.title ?? '',
                        compareFn: (p0, p1) => p0.title == p1.title,
                        selectedItem: _selectSnagsMonth,
                        onChanged: (item) {
                          if (item != null) {
                            _selectSnagsMonth = item;
                            context
                                .read<DashboardCubit>()
                                .getSnagsStatistics(
                                    months: item.value);
                          }
                        },
                      ),
                    ),
                  ],
                ),
                Divider(
                  color: AppColors.darkGrey.withOpacity(0.1),
                ),
                Row(
                  children: [
                    SnagsStatusContainer(
                      status: AppConstants.snagInProgress.title,
                      count: state.snagsStatistics?.inProgressSnagsCount ?? 0,
                      onTap: () {},
                    ),
                    UIHelper.horizontalSpace(16.0),
                    SnagsStatusContainer(
                      status: AppConstants.snagNew.title,
                      count: state.snagsStatistics?.newSnagsCount ?? 0,
                      onTap: () {},
                    ),
                  ],
                ),
                UIHelper.verticalSpace(16.0),
                Row(
                  children: [
                    SnagsStatusContainer(
                      status: AppConstants.snagCompleted.title,
                      count: state.snagsStatistics?.completedSnagsCount ?? 0,
                      onTap: () {},
                    ),
                    UIHelper.horizontalSpace(16.0),
                    SnagsStatusContainer(
                      status: AppConstants.snagCancelled.title,
                      count: state.snagsStatistics?.cancelledSnagsCount ?? 0,
                      onTap: () {},
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
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
                .onChangeSelectedIndex(context, AppConstants.inspectionIndex);
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
                    id: item.id,
                    reference: item.reference ?? '--',
                    status: item.status ?? '--',
                    communityName: item.association?.name ?? '--',
                    userName: item.inspector?.fullName ?? '--',
                    date: item.updatedAt ?? item.createdAt,
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

  _recentSnagsView(BuildContext context, DashboardState state) {
    return Column(
      children: [
        RowTitleWithViewMore(
          text: 'Recent Snags',
          onViewMorePressed: () {
            context
                .read<MainDashboardCubit>()
                .onChangeSelectedIndex(context, AppConstants.snagsIndex);
          },
        ),
        state.recentSnags?.isNotEmpty ?? false
            ? ListView.separated(
                itemCount: state.recentSnags?.length ?? 0,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  SnagModel? snag = state.recentSnags?[index];
                  return SnagWidget(
                    id: snag?.id,
                    imagesUrls: (snag?.status ==
                                AppConstants.snagCompleted.title ||
                            snag?.status == AppConstants.snagCancelled.title)
                        ? (snag?.closingImages?.isNotEmpty ?? false)
                            ? snag?.closingImages?.map((e) => e.path).toList()
                            : []
                        : snag?.images?.isNotEmpty ?? false
                            ? snag?.images?.map((e) => e.path).toList()
                            : [],
                    reference: snag?.reference ?? '--',
                    risk: snag?.risk ?? '--',
                    status: snag?.status ?? '--',
                    title: snag?.description ?? '--',
                    location: snag?.location ?? '--',
                    onTap: () {
                      if (snag?.id != null) {
                        context
                            .read<SnagDetailCubit>()
                            .onChangeCarouselIndex(0);
                        context
                            .read<SnagDetailCubit>()
                            .getSnagDetails(id: snag!.id!);
                      }
                      context
                          .read<SnagDetailCubit>()
                          .onChangeReference(snag?.reference);
                      Navigator.pushNamed(
                        context,
                        AppRoutes.snagDetail,
                        arguments: {
                          'is_from_community': false,
                        },
                      );
                    },
                  );
                },
                separatorBuilder: (context, index) {
                  return UIHelper.verticalSpace(8.0);
                },
              )
            : const EmptyWidget(
                text: 'No Snags found',
              ),
      ],
    );
  }
}
