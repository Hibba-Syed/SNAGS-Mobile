import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iskaan_inspections_mobile/bloc/snags/snag_detail/snag_detail_cubit.dart';
import 'package:iskaan_inspections_mobile/res/constants/app_colors.dart';
import 'package:iskaan_inspections_mobile/res/styles/styles.dart';
import 'package:iskaan_inspections_mobile/view/helper/ui_helper.dart';
import 'package:iskaan_inspections_mobile/view/screens/snags/components/snag_detail_container.dart';
import 'package:iskaan_inspections_mobile/view/screens/snags/components/snag_detail_item_widget.dart';
import 'package:iskaan_inspections_mobile/view/screens/snags/components/snag_image_index_bar.dart';
import 'package:iskaan_inspections_mobile/view/screens/snags/components/snag_image_status_widget.dart';
import 'package:iskaan_inspections_mobile/view/widgets/app_bar/appbar_widget.dart';
import 'package:iskaan_inspections_mobile/view/widgets/image/network_image_widget.dart';
import 'package:iskaan_inspections_mobile/view/widgets/risk_widget.dart';
import 'package:iskaan_inspections_mobile/view/widgets/status/snag_status_widget.dart';
import 'package:iskaan_inspections_mobile/view/widgets/textfield/text_field_widget.dart';

class SnagDetailScreen extends StatelessWidget {
  const SnagDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWidget(
        title: 'SN001-24-00011',
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SnagDetailContainer(
              header: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    'SN001-24-00011',
                    style: AppTextStyles.style16Grey600,
                  ),
                  UIHelper.horizontalSpace(8.0),
                  const SnagStatusWidget(
                    status: 'Completed',
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  BlocBuilder<SnagDetailCubit, SnagDetailState>(
                    builder: (context, state) {
                      return Column(
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.width / 2,
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5.0)),
                            child: Stack(
                              children: [
                                CarouselSlider(
                                  options: CarouselOptions(
                                    autoPlay: true,
                                    viewportFraction: 1,
                                    onPageChanged: (index, reason) {
                                      context
                                          .read<SnagDetailCubit>()
                                          .onChangeCarouselIndex(index);
                                    },
                                  ),
                                  items: [1, 2, 3, 4, 5].map((i) {
                                    return Builder(
                                      builder: (BuildContext context) {
                                        return Container(
                                          width:
                                              MediaQuery.of(context).size.width,
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              2,
                                          clipBehavior:
                                              Clip.antiAliasWithSaveLayer,
                                          decoration: BoxDecoration(
                                            color: Colors.grey.shade200,
                                            borderRadius:
                                                BorderRadius.circular(5.0),
                                          ),
                                          child: Image.network(
                                            '',
                                            errorBuilder:
                                                (context, object, stackTrace) {
                                              return const Icon(
                                                Icons.image_outlined,
                                                color: AppColors.lightGrey,
                                              );
                                            },
                                          ),
                                        );
                                      },
                                    );
                                  }).toList(),
                                ),
                                Positioned(
                                  left: 12.0,
                                  top: 12.0,
                                  child: SnagImageStatusWidget(
                                    isCompleted:
                                        state.carouselIndex == 2 ? true : false,
                                  ),
                                ),
                                Positioned(
                                  right: 8.0,
                                  bottom: 8.0,
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 6.0, vertical: 3.0),
                                    decoration: BoxDecoration(
                                      color: AppColors.black.withOpacity(0.4),
                                      borderRadius: BorderRadius.circular(5.0),
                                    ),
                                    child: Text(
                                      '${state.carouselIndex + 1}/5',
                                      style: AppTextStyles.style10White400,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          UIHelper.verticalSpace(10.0),
                          SizedBox(
                            width: MediaQuery.of(context).size.width,
                            height: 8.0,
                            child: Align(
                              alignment: Alignment.center,
                              child: ListView.separated(
                                itemCount: 5,
                                scrollDirection: Axis.horizontal,
                                shrinkWrap: true,
                                itemBuilder: (context, index) {
                                  return SnagImageIndexBar(
                                      isSelected: index == state.carouselIndex);
                                },
                                separatorBuilder: (context, index) {
                                  return UIHelper.horizontalSpace(2.0);
                                },
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                  const SnagDetailItemWidget(
                    title: 'Description',
                    value: 'Door Glass Broken',
                  ),
                  const SnagDetailItemWidget(
                    title: 'Community Management Company',
                    value: 'HOAM - Highrise Owners Association Management',
                  ),
                  const SnagDetailItemWidget(
                    title: 'Community',
                    value: 'Al Atar Business Tower',
                  ),
                  const SnagDetailItemWidget(
                    title: 'Reported By',
                    value: 'Shuber Ali Mirza',
                  ),
                  const SnagDetailItemWidget(
                    title: 'Location',
                    value: 'Back Entrance of the Building',
                  ),
                  const SnagDetailItemWidget(
                    title: 'Risk',
                    widget: Flexible(
                      child: RiskWidget(
                        risk: 'High Risk',
                      ),
                    ),
                  ),
                  const SnagDetailItemWidget(
                    title: 'Created At',
                    value: 'Jan 5, 2024, 10:46:11 AM',
                  ),
                  const SnagDetailItemWidget(
                    title: 'Last Update At',
                    value: 'Jan 12, 2024, 2:14:34 PM',
                  ),
                  const SnagDetailItemWidget(
                    title: 'Additional Notes',
                    value:
                        'Need to replace the glass ASAP as it is very dangerous for the community members.',
                  ),
                  UIHelper.verticalSpace(10.0),
                  const SnagDetailItemWidget(
                    title: 'Completion Notes',
                    value:
                        'Thank you for reporting the snag, We fixed the door and it is good as new.',
                  ),
                  UIHelper.verticalSpace(10.0),
                ],
              ),
            ),
            const SnagDetailContainer(
              header: Text(
                'Connected Inspection',
                style: AppTextStyles.style16Grey600,
              ),
              child: Column(
                children: [
                  SnagDetailItemWidget(
                    title: 'Reference',
                    value: 'INS001-23-00001',
                  ),
                  SnagDetailItemWidget(
                    title: 'Status',
                    widget: Flexible(
                      child: SnagStatusWidget(
                        status: 'In Progress',
                      ),
                    ),
                  ),
                  SnagDetailItemWidget(
                    title: 'Status',
                    value: 'Jan 30, 2024, 3:45:44 PM',
                  ),
                  SnagDetailItemWidget(
                    title: 'Status',
                    value: 'No Score Given',
                  ),
                ],
              ),
            ),
            SnagDetailContainer(
              header: const Text(
                'Comments',
                style: AppTextStyles.style16Grey600,
              ),
              child: Column(
                children: [
                  ListView.separated(
                    itemCount: 5,
                    shrinkWrap: true,
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    itemBuilder: (context, index) {
                      return Container(
                        padding: const EdgeInsets.all(8.0),
                        decoration: BoxDecoration(
                            border: Border.all(color: AppColors.lightGrey)),
                        child: Row(
                          children: [
                            NetworkImageWidget(
                              width: 40.0,
                              height: 40.0,
                              url: '',
                              shape: BoxShape.circle,
                              placeHolder: const Icon(
                                Icons.person,
                                color: AppColors.grey,
                              ),
                            ),
                            UIHelper.horizontalSpace(10.0),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    'Shuber Mirza',
                                    style: AppTextStyles.style14Grey600,
                                  ),
                                  UIHelper.verticalSpace(5.0),
                                  const Text(
                                    'test comment',
                                    style: AppTextStyles.style10LightGrey400,
                                  ),
                                  const Align(
                                    alignment: Alignment.bottomRight,
                                    child: Text(
                                      '2/21/24, 5:10 PM',
                                      style: AppTextStyles.style12LightGrey400,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                    separatorBuilder: (context, index) {
                      return UIHelper.verticalSpace(6.0);
                    },
                  ),
                  UIHelper.verticalSpace(10.0),
                  Row(
                    children: [
                      const Expanded(
                        child: TextFieldWidget(
                          hint: 'Add a comment',
                        ),
                      ),
                      UIHelper.horizontalSpace(10.0),
                      InkWell(
                        onTap: () {},
                        child: Container(
                          width: 40.0,
                          height: 50.0,
                          color: AppColors.primary,
                          child: const Icon(
                            Icons.send,
                            color: AppColors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SnagDetailContainer(
              header: const Text(
                'Logs',
                style: AppTextStyles.style16Grey600,
              ),
              child: ListView.separated(
                itemCount: 5,
                shrinkWrap: true,
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                itemBuilder: (context, index) {
                  return Container(
                    padding: const EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                        border: Border.all(color: AppColors.lightGrey)),
                    child: Row(
                      children: [
                        NetworkImageWidget(
                          width: 40.0,
                          height: 40.0,
                          url: '',
                          shape: BoxShape.circle,
                          placeHolder: const Icon(
                            Icons.person,
                            color: AppColors.grey,
                          ),
                        ),
                        UIHelper.horizontalSpace(10.0),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              RichText(
                                text: const TextSpan(
                                    text: 'Snag created by ',
                                    style: AppTextStyles.style12LightGrey400,
                                    children: [
                                      TextSpan(
                                          text: 'Shuber Mirza',
                                          style:
                                              AppTextStyles.style14Primary600),
                                    ]),
                              ),
                              UIHelper.verticalSpace(5.0),
                              const Text(
                                '2/21/24, 5:10 PM',
                                style: AppTextStyles.style12LightGrey400,
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
                separatorBuilder: (context, index) {
                  return UIHelper.verticalSpace(6.0);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
