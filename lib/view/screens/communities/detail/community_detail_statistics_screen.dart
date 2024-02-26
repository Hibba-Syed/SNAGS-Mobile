import 'package:flutter/material.dart';
import 'package:iskaan_inspections_mobile/res/constants/app_colors.dart';

import '../../../../res/styles/styles.dart';
import '../../../widgets/dropdown/dropdown_widget.dart';
import '../../dashboard/components/inspaction_statitics.dart';
class CommunityDetailStatisticsScreen extends StatelessWidget {
  const CommunityDetailStatisticsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: MediaQuery.sizeOf(context).width * 0.03),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: AppColors.white,
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "12",
                          style: AppTextStyles.style24Grey600,
                        ),
                        Text(
                          "Inspections",
                          style: AppTextStyles.style15Grey400,
                        ),
                      ],
                    ),
                    const Spacer(),
                    Container(
                      height: 50,
                      width: 130,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: DropdownWidget(
                        hint: "6 Months",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(
                              width: 0.0, color: Colors.transparent),
                        ),
                        fillColor: AppColors.darkGrey.withOpacity(0.1),
                        icon: const Icon(Icons.keyboard_arrow_down_outlined),
                        selectedItem: null,
                        items: [],
                        onChanged: (value) {},
                      ),
                    ),
                  ],
                ),
                Divider(
                  color: AppColors.darkGrey.withOpacity(0.1),
                ),
                const InspectionsContainer(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
