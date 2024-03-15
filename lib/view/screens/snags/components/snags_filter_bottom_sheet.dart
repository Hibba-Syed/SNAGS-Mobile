import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:iskaan_inspections_mobile/model/company_model.dart';
import 'package:iskaan_inspections_mobile/res/constants/images.dart';
import 'package:iskaan_inspections_mobile/res/globals.dart';
import 'package:iskaan_inspections_mobile/utils/date_time.dart';
import '../../../../bloc/snags/snags_cubit.dart';
import '../../../../model/association/association_model.dart';
import '../../../../res/constants/app_colors.dart';
import '../../../../res/constants/constants.dart';
import '../../../../res/styles/styles.dart';
import '../../../helper/ui_helper.dart';
import '../../../widgets/dropdown/multi_selected_dropdown_widget.dart';

class SnagsFilterBottomSheet extends StatefulWidget {
  const SnagsFilterBottomSheet({super.key});

  @override
  State<SnagsFilterBottomSheet> createState() => _SnagsFilterBottomSheetState();
}

class _SnagsFilterBottomSheetState extends State<SnagsFilterBottomSheet> {
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
                  "Snags Filter",
                  style: AppTextStyles.style21Grey600,
                )),
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
                selectedItems:
                context.watch<SnagsCubit>().state.selectedCompanies,
                items: Globals().profileRecord?.companies??[],
                itemAsString: (companies) => companies.name ?? '',
                compareFn: (companies, item) => companies.name == item.name,
                onChanged: (values) {
                  context.read<SnagsCubit>().onChangeSelectedCompanies(values);
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
                  selectedItems:
                      context.watch<SnagsCubit>().state.selectedCommunities,
                  items:Globals().profileRecord?.associations ?? [],
                  itemAsString: (community) => community.name ?? '',
                  compareFn: (community, item) => community.name == item.name,
                  onChanged: (value) {
                    context
                        .read<SnagsCubit>()
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
                    context.watch<SnagsCubit>().state.selectedStatuses,
                items: AppConstants.snagsStatuses,
                onChanged: (value) {
                  context
                      .read<SnagsCubit>()
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
              child: BlocBuilder<SnagsCubit,SnagsState>(builder: (context,state){
                return Container(
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(color: AppColors.grey.withOpacity(0.3)),
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
              },),
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
                      context.read<SnagsCubit>().clearFilterData();
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
                      context.read<SnagsCubit>().getSnags();
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
          .read<SnagsCubit>()
          .onChangeFromDate(newDateRange.start.toUtc().toIso8601String());
      context
          .read<SnagsCubit>()
          .onChangeToDate(newDateRange.end.toUtc().toIso8601String());
    } else {
      context.read<SnagsCubit>().onChangeFromDate('');
      context.read<SnagsCubit>().onChangeToDate('');
    }
  }

}
