import 'package:flutter/material.dart';
import 'package:iskaan_inspections_mobile/model/inspection/inspection_details_response_model.dart';
import 'package:iskaan_inspections_mobile/res/constants/app_colors.dart';
import 'package:iskaan_inspections_mobile/res/styles/styles.dart';
import 'package:iskaan_inspections_mobile/view/helper/ui_helper.dart';
import 'package:iskaan_inspections_mobile/view/screens/inspection/components/inspection_widget.dart';
import 'package:iskaan_inspections_mobile/view/screens/inspection/detail/components/inspection_detail_bottom_buttons.dart';
import 'package:iskaan_inspections_mobile/view/screens/inspection/detail/components/row_text_with_rating.dart';
import 'package:iskaan_inspections_mobile/view/widgets/total_score_widget.dart';

class InspectionDetailDetailsScreen extends StatelessWidget {
  final InspectionDetails? inspectionDetails;
  const InspectionDetailDetailsScreen({
    super.key,
    required this.inspectionDetails,
  });

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
                  id: null,
                  reference: inspectionDetails?.reference ?? '--',
                  status: inspectionDetails?.status ?? '--',
                  communityName: inspectionDetails?.association?.name ?? '--',
                  companyName: inspectionDetails?.company?.name ?? '--',
                  userName: inspectionDetails?.inspector?.fullName ?? '--',
                  date: inspectionDetails?.createdAt,
                  onTap: () {},
                ),
                UIHelper.verticalSpace(12.0),
                ListView.separated(
                  itemCount: inspectionDetails?.categories?.length ?? 0,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    InspectionCategory? category =
                        inspectionDetails?.categories?[index];
                    return Container(
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
                              Text(
                                category?.title ?? '--',
                                style: AppTextStyles.style14Grey600,
                              ),
                              TotalScoreWidget(
                                score: '${category?.score ?? '0'}',
                                color: AppColors.red,
                              ),
                            ],
                          ),
                          UIHelper.verticalSpace(10.0),
                          ListView.separated(
                            itemCount: category?.items?.length ?? 0,
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) {
                              InspectionCategoryItem? categoryItem =
                                  category?.items?[index];
                              return RowTextWithRating(
                                text: categoryItem?.title ?? '--',
                                rating: categoryItem?.rating?.toDouble(),
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
                              Text(
                                category?.inspector?.fullName ?? '--',
                                style: AppTextStyles.style14Grey600,
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return UIHelper.verticalSpace(16.0);
                  },
                ),
              ],
            ),
          ),
        ),
        InspectionDetailBottomButtons(
          onSubmitPressed: () {},
          onEditPressed: () {},
          onArchivePressed: () {},
        ),
        UIHelper.verticalSpace(10.0),
      ],
    );
  }
}
