import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:iskaan_inspections_mobile/res/constants/app_colors.dart';
import 'package:iskaan_inspections_mobile/res/styles/styles.dart';
import 'package:iskaan_inspections_mobile/view/helper/ui_helper.dart';
import 'package:iskaan_inspections_mobile/view/screens/inspection/components/how_ratings_work_item.dart';
import 'package:iskaan_inspections_mobile/view/screens/inspection/components/ni_button.dart';
import 'package:iskaan_inspections_mobile/view/screens/inspection/components/rating_info_widget.dart';
import 'package:iskaan_inspections_mobile/view/widgets/app_bar/appbar_widget.dart';
import 'package:iskaan_inspections_mobile/view/widgets/dropdown/dropdown_widget.dart';
import 'package:iskaan_inspections_mobile/view/widgets/textfield/text_field_widget.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:super_tooltip/super_tooltip.dart';

class AddInspectionScreen extends StatelessWidget {
  const AddInspectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWidget(
        title: 'Add Inspection',
        isNotificationEnabled: false,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            DropdownWidget<String>(
              label: 'Select Community',
              hint: 'Select a Community',
              selectedItem: null,
              items: const ['A', 'B', 'C'],
              onChanged: (value) {},
            ),
            UIHelper.verticalSpace(10.0),
            const RatingInfoWidget(),
            Container(
              padding: const EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(10.0),
                border: const Border.symmetric(
                  vertical: BorderSide(color: AppColors.yellow, width: 3),
                  horizontal: BorderSide(
                    color: AppColors.yellow,
                  ),
                ),
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Flexible(
                        child: Text(
                          'General Appearance',
                          style: AppTextStyles.style16Grey600,
                        ),
                      ),
                      Row(
                        children: [
                          LinearPercentIndicator(
                            width: MediaQuery.of(context).size.width / 2.5,
                            lineHeight: 12.0,
                            percent: 0.2,
                            center: const Text(
                              '20%',
                              style: AppTextStyles.style9White500,
                            ),
                            barRadius: const Radius.circular(10),
                            backgroundColor: AppColors.lightGrey,
                            progressColor: AppColors.primary,
                          ),
                          const Icon(
                            Icons.keyboard_arrow_down,
                            color: AppColors.grey,
                          ),
                        ],
                      ),
                    ],
                  ),
                  UIHelper.verticalSpace(10.0),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    padding: const EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                        color: Colors.grey.shade100,
                        borderRadius: BorderRadius.circular(5.0)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Building exteriors',
                          style: AppTextStyles.style14LightGrey600,
                        ),
                        const Divider(),
                        const Text(
                          'Score',
                          style: AppTextStyles.style16LightGrey400,
                        ),
                        UIHelper.verticalSpace(8.0),
                        Row(
                          children: [
                            RatingBar(
                              unratedColor: AppColors.yellow,
                              allowHalfRating: true,
                              glow: false,
                              itemSize: 24,
                              ratingWidget: RatingWidget(
                                  full: const Icon(
                                    Icons.star,
                                    color: AppColors.yellow,
                                  ),
                                  half: const Icon(
                                    Icons.star_half,
                                    color: AppColors.yellow,
                                  ),
                                  empty: const Icon(
                                    Icons.star_outline,
                                    color: AppColors.red,
                                  )),
                              onRatingUpdate: (value) {},
                            ),
                            NIButton(
                              onValueChanged: (value){
                                print(value);
                              },
                            ),
                          ],
                        ),
                        UIHelper.verticalSpace(10.0),
                         TextFieldWidget(
                          label: 'Note',
                          hint: 'Enter note here',
                          validator: (value){
                            if(value?.isEmpty??true){
                              return 'required';
                            }
                            return null;
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
