import 'package:flutter/material.dart';
import 'package:iskaan_inspections_mobile/res/constants/app_colors.dart';
import 'package:iskaan_inspections_mobile/res/styles/styles.dart';
import 'package:iskaan_inspections_mobile/view/helper/ui_helper.dart';
import 'package:iskaan_inspections_mobile/view/screens/inspection/components/inspection_widget.dart';
import 'package:iskaan_inspections_mobile/view/screens/inspection/detail/components/inspection_detail_bottom_buttons.dart';
import 'package:iskaan_inspections_mobile/view/screens/inspection/detail/components/row_text_with_rating.dart';
import 'package:iskaan_inspections_mobile/view/widgets/total_score_widget.dart';

class InspectionDetailDetailsScreen extends StatelessWidget {
  const InspectionDetailDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: SingleChildScrollView(
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
            child: Column(
              children: [
                InspectionWidget(
                  reference: 'INS001-24-00003',
                  status: 'In Progress',
                  communityName: 'Al Attar Business Tower',
                  companyName:
                      'HOAM - Highrise Owners Association Management',
                  userName: 'Muhammad Talha Al Mehri',
                  date: 'May 08, 2023',
                  onTap: () {},
                ),
                UIHelper.verticalSpace(12.0),
                Container(
                  padding: const EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Column(
                    children: [
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'General Appearance',
                            style: AppTextStyles.style14Grey600,
                          ),
                          TotalScoreWidget(
                            score: '73.33%',
                            color: AppColors.red,
                          ),
                        ],
                      ),
                      UIHelper.verticalSpace(10.0),
                      ListView.separated(
                        itemCount: 5,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          return const RowTextWithRating(
                            text: 'Building Exteriors',
                            rating: 5,
                          );
                        },
                        separatorBuilder: (context, index) {
                          return UIHelper.verticalSpace(6.0);
                        },
                      ),
                      UIHelper.verticalSpace(10.0),
                      Row(
                        children: [
                          const Icon(
                            Icons.person_outline,
                            color: AppColors.primary,
                            size: 20,
                          ),
                          UIHelper.horizontalSpace(5.0),
                          const Text(
                            'Done By:',
                            style: AppTextStyles.style14LightGrey400,
                          ),
                          UIHelper.horizontalSpace(3.0),
                          const Text(
                            'Muhammad Talha Al Mehri',
                            style: AppTextStyles.style14Grey600,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                UIHelper.verticalSpace(16.0),
                Container(
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
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const Text(
                                'Services',
                                style: AppTextStyles.style14Grey600,
                              ),
                              UIHelper.horizontalSpace(5.0),
                              const Icon(
                                Icons.sticky_note_2_outlined,
                                color: AppColors.primary,
                                size: 18,
                              ),
                            ],
                          ),
                          const TotalScoreWidget(
                            score: '73.33%',
                            color: AppColors.green,
                          ),
                        ],
                      ),
                      UIHelper.verticalSpace(10.0),
                      ListView.separated(
                        itemCount: 5,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          return const RowTextWithRating(
                            text: 'Building Exteriors',
                            rating: 5,
                          );
                        },
                        separatorBuilder: (context, index) {
                          return UIHelper.verticalSpace(6.0);
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        InspectionDetailBottomButtons(
          onSubmitPressed: () {},
          onEditPressed: () {},
          onDeletePressed: () {},
        ),
        UIHelper.verticalSpace(10.0),
      ],
    );
  }
}
