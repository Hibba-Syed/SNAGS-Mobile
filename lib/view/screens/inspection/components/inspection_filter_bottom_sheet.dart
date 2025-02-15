import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:iskaan_inspections_mobile/model/association/association_model.dart';
import 'package:iskaan_inspections_mobile/model/company_model.dart';
import 'package:iskaan_inspections_mobile/res/constants/constants.dart';
import 'package:iskaan_inspections_mobile/res/constants/images.dart';
import 'package:iskaan_inspections_mobile/res/globals.dart';
import 'package:iskaan_inspections_mobile/utils/date_time.dart';

import '../../../../bloc/inspection/inspection_cubit.dart';
import '../../../../res/constants/app_colors.dart';
import '../../../../res/styles/styles.dart';
import '../../../helper/ui_helper.dart';
import '../../../widgets/dropdown/multi_selected_dropdown_widget.dart';

class InspectionFilterBottomSheet extends StatefulWidget {
  const InspectionFilterBottomSheet({super.key});

  @override
  State<InspectionFilterBottomSheet> createState() =>
      _InspectionFilterBottomSheetState();
}

class _InspectionFilterBottomSheetState
    extends State<InspectionFilterBottomSheet> {
  DateTimeRange? dateRange;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 10.0),
      decoration: const BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20), topRight: Radius.circular(20)),
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            UIHelper.verticalSpace(10),
            const Align(
              alignment: Alignment.center,
              child: Text(
                "Inspection Filter",
                style: AppTextStyles.style21Grey600,
              ),
            ),
            UIHelper.verticalSpace(15),
            const Text(
              "Community Management Company",
              style: AppTextStyles.style16darkGrey600,
            ),
            Container(
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(color: AppColors.grey.withOpacity(0.3)),
                ),
              ),
              child: MultiSelectedDropdownWidget<Company>(
                icon: const Icon(Icons.keyboard_arrow_down_outlined),
                hint: "Select Company",
                selectedItems: context
                    .watch<InspectionCubit>()
                    .state
                    .selectedCompanies,
                items: Globals().profileRecord?.companies ?? [],
                itemAsString: (companies) => companies.name ?? '',
                compareFn: (companies, item) => companies.name == item.name,
                onChanged:  (values) {
                  context
                      .read<InspectionCubit>().onChangeSelectedCompanies(values);
                },
              ),
            ),
            UIHelper.verticalSpace(10),
            const Text(
              "Community",
              style: AppTextStyles.style16darkGrey600,
            ),
            Container(
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(color: AppColors.grey.withOpacity(0.3)),
                  ),
                ),
                child: MultiSelectedDropdownWidget<Association>(
                  hint: "Select Community",
                  icon: const Icon(Icons.keyboard_arrow_down_outlined),
                  selectedItems: context
                      .watch<InspectionCubit>()
                      .state
                      .selectedCommunities,
                  items: Globals().profileRecord?.associations ?? [],
                  itemAsString: (community) => community.name ?? '',
                  compareFn: (community, item) => community.name == item.name,
                  onChanged: (value) {
                    context
                        .read<InspectionCubit>()
                        .onChangeSelectedCommunities(value);
                  },
                )),
            UIHelper.verticalSpace(10),
            const Text(
              "Status",
              style: AppTextStyles.style16darkGrey600,
            ),
            Container(
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(color: AppColors.grey.withOpacity(0.3)),
                ),
              ),
              child: MultiSelectedDropdownWidget<String>(
                hint: "Select Status",
                icon: const Icon(Icons.keyboard_arrow_down_outlined),
                selectedItems:
                    context.watch<InspectionCubit>().state.selectedStatuses,
                items: AppConstants.inspectionStatuses,
                onChanged: (value) {
                  context
                      .read<InspectionCubit>()
                      .onChangeSelectedStatuses(value);
                },
              ),
            ),
            UIHelper.verticalSpace(10),
            const Text(
              "Data Range",
              style: AppTextStyles.style16darkGrey600,
            ),
            UIHelper.verticalSpace(16),
            InkWell(
              onTap: () {
                pickDateRange();
              },
              child: BlocBuilder<InspectionCubit, InspectionState>(
                builder: (context, state) {
                  return Container(
                    decoration: BoxDecoration(
                      border: Border(
                        bottom:
                            BorderSide(color: AppColors.grey.withOpacity(0.3)),
                      ),
                    ),
                    child: Row(
                      children: [
                        Text(
                          ((state.fromDate?.isNotEmpty ?? false) &&
                                  (state.toDate?.isNotEmpty ?? false))
                              ? "${DateTimeUtil.getFormattedDate(state.fromDate)}  -  ${DateTimeUtil.getFormattedDate(state.toDate)}"
                              : 'Select date range',
                          style: AppTextStyles.style16darkGrey600,
                        ),
                        const Spacer(),
                        const Padding(
                          padding: EdgeInsets.only(right: 10),
                          child: Icon(Icons.keyboard_arrow_down_outlined),
                        )
                      ],
                    ),
                  );
                },
              ),
            ),
            UIHelper.verticalSpace(15),
            Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: AppColors.grey.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: IconButton(
                    onPressed: () {
                      context.read<InspectionCubit>().clearFilterData();
                      Navigator.pop(context);
                    },
                    icon: SvgPicture.asset(AppImages.icClearFilter),
                  ),
                ),
                UIHelper.horizontalSpace(10),
                Expanded(
                  child: InkWell(
                    overlayColor:
                        const MaterialStatePropertyAll(Colors.transparent),
                    onTap: () {
                      context.read<InspectionCubit>().getInspections();
                      Navigator.pop(context);
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6),
                          color: AppColors.primary),
                      alignment: Alignment.center,
                      child: const Text(
                        'Apply Filters',
                        style: AppTextStyles.style16white600,
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Future pickDateRange() async {
    DateTimeRange? newDateRange = await showDateRangePicker(
      context: context,
      firstDate: DateTime(2019),
      lastDate: DateTime(2025, 01, 01),
    );
    if (newDateRange != null) {
      context
          .read<InspectionCubit>()
          .onChangeFromDate(newDateRange.start.toUtc().toIso8601String());
      context
          .read<InspectionCubit>()
          .onChangeToDate(newDateRange.end.toUtc().toIso8601String());
    } else {
      context.read<InspectionCubit>().onChangeFromDate('');
      context.read<InspectionCubit>().onChangeToDate('');
    }
  }
}
