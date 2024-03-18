import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iskaan_inspections_mobile/bloc/communities/detail/community_details_statistics/community_detail_statistics_cubit.dart';
import 'package:iskaan_inspections_mobile/res/constants/app_colors.dart';
import 'package:iskaan_inspections_mobile/res/constants/constants.dart';
import 'package:iskaan_inspections_mobile/view/helper/ui_helper.dart';
import 'package:iskaan_inspections_mobile/view/widgets/custom_loader.dart';
import 'package:iskaan_inspections_mobile/view/widgets/inspactions_status_container.dart';
import 'package:iskaan_inspections_mobile/view/widgets/snags_status_container.dart';

import '../../../../model/month_filter_model.dart';
import '../../../../res/styles/styles.dart';
import '../../../widgets/dropdown/dropdown_widget.dart';

class CommunityDetailStatisticsScreen extends StatelessWidget {
  CommunityDetailStatisticsScreen({super.key});
  MonthFilterModel _selectInspectionMonth =
      MonthFilterModel(title: "1Y", value: 12);
  MonthFilterModel _selectSnagsMonth = MonthFilterModel(title: "1Y", value: 12);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.sizeOf(context).width * 0.03),
      child: BlocBuilder<CommunityDetailStatisticsCubit,
          CommunityDetailStatisticsState>(
        builder: (context, state) {
          if (state.isLoading == true) {
            return const CustomLoader();
          }
          return Column(
            children: [
              _snagsAndInspectionsView(context, state),
            ],
          );
        },
      ),
    );
  }

  _snagsAndInspectionsView(
      BuildContext context, CommunityDetailStatisticsState state) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Inspections',
          style: AppTextStyles.style16Grey600,
        ),
        UIHelper.verticalSpace(10.0),
        Container(
          width: MediaQuery.of(context).size.width,
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
                    child: StatefulBuilder(
                      builder: (context, changeState) {
                        return DropdownWidget<MonthFilterModel>(
                            hint: "select",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(
                                  width: 0.0, color: Colors.transparent),
                            ),
                            fillColor: AppColors.darkGrey.withOpacity(0.1),
                            icon:
                                const Icon(Icons.keyboard_arrow_down_outlined),
                            selectedItem: _selectInspectionMonth,
                            itemAsString: (month) => month.title ?? '',
                            compareFn: (p0, p1) => p0.title == p1.title,
                            items: AppConstants.totalInspectionList,
                            onChanged: (item) {
                              if (item != null) {
                                _selectInspectionMonth = item;
                                context
                                    .read<CommunityDetailStatisticsCubit>()
                                    .getCommunityInspectionsStatistics(
                                        months: item.value);
                                changeState(() {});
                              }
                            });
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
                    count: state
                            .inspectionsStatistics?.newInspectionReportsCount ??
                        0,
                    onTap: () {},
                  ),
                  UIHelper.horizontalSpace(16.0),
                  InspectionsStatusContainer(
                    status: AppConstants.inspectionReadyForSubmission.title,
                    count: state
                            .inspectionsStatistics?.newInspectionReportsCount ??
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
        UIHelper.verticalSpace(20.0),
        const Text(
          'Snags',
          style: AppTextStyles.style16Grey600,
        ),
        UIHelper.verticalSpace(10.0),
        Container(
          width: MediaQuery.of(context).size.width,
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
                    child: StatefulBuilder(builder: (context,changeState){
                      return DropdownWidget<MonthFilterModel>(
                          hint: "select",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(
                                width: 0.0, color: Colors.transparent),
                          ),
                          fillColor: AppColors.darkGrey.withOpacity(0.1),
                          icon: const Icon(Icons.keyboard_arrow_down_outlined),
                          selectedItem: _selectSnagsMonth,
                          itemAsString: (month) => month.title ?? '',
                          compareFn: (p0, p1) => p0.title == p1.title,
                          items: AppConstants.totalInspectionList,
                          onChanged: (item) {
                            print(item);
                            if (item != null) {
                              _selectSnagsMonth = item;
                              print(item.value);
                              context
                                  .read<CommunityDetailStatisticsCubit>()
                                  .getCommunitySnagsStatistics(
                                  months: item.value);
                              changeState((){});
                            }
                          });
                    },),
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
    );
  }
}
