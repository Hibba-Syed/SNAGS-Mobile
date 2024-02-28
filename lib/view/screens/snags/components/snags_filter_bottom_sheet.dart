import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:iskaan_inspections_mobile/res/constants/images.dart';

import '../../../../bloc/communities/communities_cubit.dart';
import '../../../../bloc/inspection/inspection_cubit.dart';
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
  DateTimeRange? dateRange;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 22,vertical: 10.0),
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
              child: MultiSelectedDropdownWidget(
                icon: const Icon(Icons.keyboard_arrow_down_outlined),
                hint: "Select Company",
                selectedItems: const [],
                items: const ["1", "2", "3"],
                onChanged: (List<dynamic> selectedItems) {},
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
                  items:
                  context.watch<CommunitiesCubit>().state.communities ??
                      [],
                  itemAsString: (community) => community.name ?? '',
                  compareFn: (community, item) =>
                  community.name == item.name,
                  onChanged: (value) {
                    context
                        .read<InspectionCubit>()
                        .onChangeSelectedCommunities(value);
                  },
                )

            ),
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
                selectedItems: context
                    .watch<InspectionCubit>()
                    .state
                    .selectedCStatuses,
                items:AppConstants.snagsStatuses,
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
                pickDateRang();
              },
              child: Container(
                decoration: BoxDecoration(
                  border: Border(
                    bottom:
                        BorderSide(color: AppColors.grey.withOpacity(0.3)),
                  ),
                ),
                child: Row(
                  children: [
                    Text(
                      dateRange != null
                          ? "${dateRange?.start.year} / ${dateRange?.start.month} / ${dateRange?.start.day}   ${dateRange?.end.year} / ${dateRange?.end.month} / ${dateRange?.end.day} "
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

  Future pickDateRang() async {
    DateTimeRange? newDateRange = await showDateRangePicker(
      initialDateRange: dateRange,
      context: context,
      firstDate: DateTime(2019),
      lastDate: DateTime(2025, 01, 01),
    );
    if (newDateRange == null) {
      dateRange = null;
    } else {
      dateRange = newDateRange;
    }
    setState(() {});
  }
}
