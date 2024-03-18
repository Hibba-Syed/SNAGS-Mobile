import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iskaan_inspections_mobile/bloc/snags/snag_detail/snag_detail_cubit.dart';
import 'package:iskaan_inspections_mobile/model/comment_model.dart';
import 'package:iskaan_inspections_mobile/model/image_model.dart';
import 'package:iskaan_inspections_mobile/model/log_model.dart';
import 'package:iskaan_inspections_mobile/model/snag/snag_model.dart';
import 'package:iskaan_inspections_mobile/res/constants/app_colors.dart';
import 'package:iskaan_inspections_mobile/res/constants/constants.dart';
import 'package:iskaan_inspections_mobile/res/styles/styles.dart';
import 'package:iskaan_inspections_mobile/utils/date_time.dart';
import 'package:iskaan_inspections_mobile/utils/routes/app_routes.dart';
import 'package:iskaan_inspections_mobile/view/helper/ui_helper.dart';
import 'package:iskaan_inspections_mobile/view/screens/snags/components/snag_detail_bottom_buttons.dart';
import 'package:iskaan_inspections_mobile/view/screens/snags/components/snag_detail_container.dart';
import 'package:iskaan_inspections_mobile/view/screens/snags/components/snag_detail_item_widget.dart';
import 'package:iskaan_inspections_mobile/view/screens/snags/components/snag_image_index_bar.dart';
import 'package:iskaan_inspections_mobile/view/screens/snags/components/snag_image_status_widget.dart';
import 'package:iskaan_inspections_mobile/view/widgets/app_bar/appbar_widget.dart';
import 'package:iskaan_inspections_mobile/view/widgets/button/custom_button.dart';
import 'package:iskaan_inspections_mobile/view/widgets/custom_loader.dart';
import 'package:iskaan_inspections_mobile/view/widgets/empty_widget.dart';
import 'package:iskaan_inspections_mobile/view/widgets/image/network_image_widget.dart';
import 'package:iskaan_inspections_mobile/view/widgets/log_widget.dart';
import 'package:iskaan_inspections_mobile/view/widgets/risk_widget.dart';
import 'package:iskaan_inspections_mobile/view/widgets/status/inspection_status_widget.dart';
import 'package:iskaan_inspections_mobile/view/widgets/status/snag_status_widget.dart';
import 'package:iskaan_inspections_mobile/view/widgets/textfield/text_field_widget.dart';

class SnagDetailScreen extends StatelessWidget {
  const SnagDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SnagDetailCubit, SnagDetailState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBarWidget(
            title: state.reference,
          ),
          body: state.isLoading
              ? const CustomLoader()
              : state.snagDetails == null
                  ? const EmptyWidget(
                      text: 'No details found',
                    )
                  : Column(
                      children: [
                        Expanded(
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                Container(
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 16.0, vertical: 10.0),
                                  padding: const EdgeInsets.all(8.0),
                                  width: MediaQuery.of(context).size.width,
                                  decoration: BoxDecoration(
                                    color: AppColors.white,
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Text(
                                            state.snagDetails?.reference ??
                                                '--',
                                            style: AppTextStyles.style16Grey600,
                                          ),
                                          UIHelper.horizontalSpace(8.0),
                                          SnagStatusWidget(
                                            status: state.snagDetails?.status ??
                                                '--',
                                          ),
                                        ],
                                      ),
                                      UIHelper.verticalSpace(16.0),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Column(
                                            children: [
                                              Builder(
                                                builder: (context) {
                                                  List<ImageModel> images = [];
                                                  if ((state.snagDetails
                                                              ?.status ==
                                                          AppConstants
                                                              .snagCompleted
                                                              .title ||
                                                      state.snagDetails
                                                              ?.status ==
                                                          AppConstants
                                                              .snagCancelled
                                                              .title)) {
                                                    images = state.snagDetails
                                                            ?.closingImages ??
                                                        [];
                                                  } else {
                                                    images = state.snagDetails
                                                            ?.images ??
                                                        [];
                                                  }
                                                  return Container(
                                                    width:
                                                        MediaQuery.of(context)
                                                            .size
                                                            .width,
                                                    height:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width /
                                                            2,
                                                    clipBehavior: Clip
                                                        .antiAliasWithSaveLayer,
                                                    decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(5.0)),
                                                    child: (images.isNotEmpty)
                                                        ? Stack(
                                                            children: [
                                                              CarouselSlider(
                                                                options:
                                                                    CarouselOptions(
                                                                  autoPlay:
                                                                      true,
                                                                  viewportFraction:
                                                                      1,
                                                                  onPageChanged:
                                                                      (index,
                                                                          reason) {
                                                                    context
                                                                        .read<
                                                                            SnagDetailCubit>()
                                                                        .onChangeCarouselIndex(
                                                                            index);
                                                                  },
                                                                ),
                                                                items: images
                                                                    .map((i) {
                                                                  return Container(
                                                                    width: MediaQuery.of(
                                                                            context)
                                                                        .size
                                                                        .width,
                                                                    height: MediaQuery.of(context)
                                                                            .size
                                                                            .width /
                                                                        2,
                                                                    clipBehavior:
                                                                        Clip.antiAliasWithSaveLayer,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      color: Colors
                                                                          .grey
                                                                          .shade200,
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              5.0),
                                                                    ),
                                                                    child:
                                                                        NetworkImageWidget(
                                                                      url: i
                                                                          .path,
                                                                    ),
                                                                  );
                                                                }).toList(),
                                                              ),
                                                              Positioned(
                                                                left: 12.0,
                                                                top: 12.0,
                                                                child:
                                                                    SnagImageStatusWidget(
                                                                  status: state
                                                                          .snagDetails
                                                                          ?.status ??
                                                                      '--',
                                                                ),
                                                              ),
                                                              if (state
                                                                      .snagDetails
                                                                      ?.images
                                                                      ?.isNotEmpty ??
                                                                  false)
                                                                Positioned(
                                                                  right: 8.0,
                                                                  bottom: 8.0,
                                                                  child:
                                                                      Container(
                                                                    padding: const EdgeInsets
                                                                        .symmetric(
                                                                        horizontal:
                                                                            6.0,
                                                                        vertical:
                                                                            3.0),
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      color: AppColors
                                                                          .black
                                                                          .withOpacity(
                                                                              0.4),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              5.0),
                                                                    ),
                                                                    child: Text(
                                                                      '${state.carouselIndex + 1}/${state.snagDetails?.images?.length ?? 0}',
                                                                      style: AppTextStyles
                                                                          .style10White400,
                                                                    ),
                                                                  ),
                                                                ),
                                                            ],
                                                          )
                                                        : const EmptyWidget(
                                                            text:
                                                                'No Images found',
                                                          ),
                                                  );
                                                },
                                              ),
                                              UIHelper.verticalSpace(10.0),
                                              SizedBox(
                                                width: MediaQuery.of(context)
                                                    .size
                                                    .width,
                                                height: 8.0,
                                                child: Align(
                                                  alignment: Alignment.center,
                                                  child: ListView.separated(
                                                    itemCount: state.snagDetails
                                                            ?.images?.length ??
                                                        0,
                                                    scrollDirection:
                                                        Axis.horizontal,
                                                    shrinkWrap: true,
                                                    itemBuilder:
                                                        (context, index) {
                                                      return SnagImageIndexBar(
                                                          isSelected: index ==
                                                              state
                                                                  .carouselIndex);
                                                    },
                                                    separatorBuilder:
                                                        (context, index) {
                                                      return UIHelper
                                                          .horizontalSpace(2.0);
                                                    },
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          SnagDetailItemWidget(
                                            title: 'Description',
                                            value: state.snagDetails?.title ??
                                                '--',
                                          ),
                                          SnagDetailItemWidget(
                                            title:
                                                'Community Management Company',
                                            value: state.snagDetails?.company
                                                    ?.name ??
                                                '--',
                                          ),
                                          SnagDetailItemWidget(
                                            title: 'Community',
                                            value: state.snagDetails
                                                    ?.association?.name ??
                                                '--',
                                          ),
                                          SnagDetailItemWidget(
                                            title: 'Reported By',
                                            value: state.snagDetails?.inspector
                                                    ?.fullName ??
                                                '--',
                                          ),
                                          SnagDetailItemWidget(
                                            title: 'Location',
                                            value:
                                                state.snagDetails?.location ??
                                                    '--',
                                          ),
                                          SnagDetailItemWidget(
                                            title: 'Risk',
                                            widget: RiskWidget(
                                              risk: state.snagDetails?.risk ??
                                                  '--',
                                            ),
                                          ),
                                          SnagDetailItemWidget(
                                            title: 'Created At',
                                            value:
                                                state.snagDetails?.createdAt ??
                                                    '--',
                                          ),
                                          SnagDetailItemWidget(
                                            title: 'Last Update At',
                                            value:
                                                state.snagDetails?.updatedAt ??
                                                    '--',
                                          ),
                                          SnagDetailItemWidget(
                                              title: 'Additional Notes',
                                              value: state.snagDetails
                                                      ?.description ??
                                                  '--'),
                                          UIHelper.verticalSpace(10.0),
                                          if (state.snagDetails?.status ==
                                              AppConstants.snagCompleted.title)
                                            SnagDetailItemWidget(
                                              title: 'Completion Notes',
                                              value: state
                                                      .snagDetails?.closeNote ??
                                                  '--',
                                            ),
                                          if (state.snagDetails?.status ==
                                              AppConstants.snagCancelled.title)
                                            SnagDetailItemWidget(
                                              title: 'Cancellation Notes',
                                              value: state
                                                      .snagDetails?.closeNote ??
                                                  '--',
                                            ),
                                          if (state.snagDetails?.status ==
                                                  AppConstants
                                                      .snagCompleted.title ||
                                              state.snagDetails?.status ==
                                                  AppConstants
                                                      .snagCancelled.title)
                                            UIHelper.verticalSpace(10.0),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                SnagDetailContainer(
                                  header: const Text(
                                    'Connected Inspection',
                                    style: AppTextStyles.style16Grey600,
                                  ),
                                  child: state.snagDetails?.inspection != null
                                      ? Column(
                                          children: [
                                            SnagDetailItemWidget(
                                              title: 'Reference',
                                              value: state.snagDetails
                                                      ?.inspection?.reference ??
                                                  '--',
                                            ),
                                            SnagDetailItemWidget(
                                              title: 'Status',
                                              widget: Row(
                                                mainAxisSize: MainAxisSize.min,
                                                children: [
                                                  InspectionStatusWidget(
                                                    status: state
                                                            .snagDetails
                                                            ?.inspection
                                                            ?.status ??
                                                        '--',
                                                  ),
                                                ],
                                              ),
                                            ),
                                            SnagDetailItemWidget(
                                              title: 'Last Updated At',
                                              value: (state
                                                          .snagDetails
                                                          ?.inspection
                                                          ?.updatedAt
                                                          ?.isNotEmpty ??
                                                      false)
                                                  ? state.snagDetails
                                                      ?.inspection?.updatedAt
                                                  : state.snagDetails
                                                      ?.inspection?.createdAt,
                                            ),
                                            SnagDetailItemWidget(
                                              title: 'Score',
                                              value:
                                                  '${state.snagDetails?.inspection?.score ?? 0}',
                                            ),
                                          ],
                                        )
                                      : const EmptyWidget(
                                          text: 'No Inspection found',
                                        ),
                                ),
                                SnagDetailContainer(
                                  header: const Text(
                                    'Comments',
                                    style: AppTextStyles.style16Grey600,
                                  ),
                                  child: (state.snagDetails?.comments
                                              ?.isNotEmpty ??
                                          false)
                                      ? Column(
                                          children: [
                                            ListView.separated(
                                              itemCount: state.snagDetails
                                                      ?.comments?.length ??
                                                  0,
                                              shrinkWrap: true,
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 8.0),
                                              itemBuilder: (context, index) {
                                                Comment item = state
                                                    .snagDetails!
                                                    .comments![index];
                                                return Row(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    NetworkImageWidget(
                                                      width: 40.0,
                                                      height: 40.0,
                                                      url: item.commenter
                                                          ?.profilePicture,
                                                      shape: BoxShape.circle,
                                                      placeHolder: const Icon(
                                                        Icons.person,
                                                        color: AppColors.grey,
                                                      ),
                                                    ),
                                                    UIHelper.horizontalSpace(
                                                        10.0),
                                                    Expanded(
                                                      child: Container(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(10.0),
                                                        decoration:
                                                            BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      10.0),
                                                          color: Colors
                                                              .grey.shade100,
                                                        ),
                                                        child: Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Text(
                                                              item.commenter
                                                                      ?.name ??
                                                                  '--',
                                                              style: AppTextStyles
                                                                  .style14Grey600,
                                                            ),
                                                            UIHelper
                                                                .verticalSpace(
                                                                    5.0),
                                                            Text(
                                                              item.comment ??
                                                                  '--',
                                                              style: AppTextStyles
                                                                  .style10LightGrey400,
                                                            ),
                                                            Align(
                                                              alignment: Alignment
                                                                  .bottomRight,
                                                              child: Text(
                                                                DateTimeUtil
                                                                    .getFormattedDateTime(
                                                                        item.createdAt),
                                                                style: AppTextStyles
                                                                    .style12LightGrey400,
                                                              ),
                                                            )
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                );
                                              },
                                              separatorBuilder:
                                                  (context, index) {
                                                return UIHelper.verticalSpace(
                                                    6.0);
                                              },
                                            ),
                                            UIHelper.verticalSpace(10.0),
                                            TextFieldWidget(
                                              hint: 'Add a comment',
                                              fillColor: Colors.grey.shade100,
                                              suffix: IconButton(
                                                onPressed: () {},
                                                icon: const Icon(Icons.send),
                                                color: AppColors.primary,
                                              ),
                                              errorBorder: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10.0),
                                                borderSide: const BorderSide(
                                                  color: AppColors.red,
                                                ),
                                              ),
                                              focusedErrorBorder:
                                                  OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10.0),
                                                borderSide: const BorderSide(
                                                  color: AppColors.red,
                                                ),
                                              ),
                                              enabledBorder: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10.0),
                                                borderSide: const BorderSide(
                                                  color: Colors.transparent,
                                                ),
                                              ),
                                              focusedBorder: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10.0),
                                                borderSide: const BorderSide(
                                                  color: AppColors.primary,
                                                ),
                                              ),
                                            ),
                                          ],
                                        )
                                      : const EmptyWidget(
                                          text: 'No comments found',
                                        ),
                                ),
                                SnagDetailContainer(
                                  header: const Text(
                                    'Logs',
                                    style: AppTextStyles.style16Grey600,
                                  ),
                                  child: (state.snagDetails?.logs?.isNotEmpty ??
                                          false)
                                      ? ListView.separated(
                                          itemCount:
                                              state.snagDetails?.logs?.length ??
                                                  0,
                                          shrinkWrap: true,
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 8.0),
                                          itemBuilder: (context, index) {
                                            LogModel item =
                                                state.snagDetails!.logs![index];
                                            return LogWidget(
                                              description: item.description,
                                              loggerName: item.logger?.name,
                                              date: item.createdAt,
                                              loggerImageUrl:
                                                  item.logger?.profilePicture,
                                            );
                                          },
                                          separatorBuilder: (context, index) {
                                            return UIHelper.verticalSpace(6.0);
                                          },
                                        )
                                      : const EmptyWidget(
                                          text: 'No Logs found',
                                        ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SnagDetailBottomButtons(
                          status: state.snagDetails?.status ?? '',
                          onEditPressed: () {
                            Map<String, dynamic>? args = ModalRoute.of(context)
                                ?.settings
                                .arguments as Map<String, dynamic>;
                            Navigator.pushNamed(
                              context,
                              AppRoutes.editSnag,
                              arguments: {
                                'community': args['is_from_community'] == true
                                    ? state.snagDetails?.association
                                    : null,
                                'snag': state.snagDetails,
                              },
                            ).then((value) {
                              if (value != null) {
                                SnagModel? snag = value as SnagModel;
                                if (snag.id != null) {
                                  context
                                      .read<SnagDetailCubit>()
                                      .getSnagDetails(id: snag.id!);
                                }
                              }
                            });
                          },
                          onMergePressed: () {
                            context
                                .read<SnagDetailCubit>()
                                .onChangeSnagsToMerge([]);
                            context
                                .read<SnagDetailCubit>()
                                .onChangeSelectedSnagsToMerge([]);
                            Navigator.pushNamed(context, AppRoutes.mergeSnag)
                                .then((value) {
                              if (value == true) {
                                if (state.snagDetails?.id != null) {
                                  context
                                      .read<SnagDetailCubit>()
                                      .getSnagDetails(
                                          id: state.snagDetails!.id!);
                                }
                              }
                            });
                          },
                          onStartPressed: () {
                            _showStartDialog(context);
                          },
                          onCancelPressed: () {},
                          onCompletePressed: () {},
                        ),
                        UIHelper.verticalSpace(10.0),
                      ],
                    ),
        );
      },
    );
  }

  _showStartDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: AppColors.white,
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(
                Icons.info_outline,
                color: AppColors.primary,
                size: 50,
              ),
              UIHelper.verticalSpace(16.0),
              const Text(
                'Are you sure you want to start processing this snag?',
                style: AppTextStyles.style16Grey600,
              ),
              UIHelper.verticalSpace(10.0),
              Row(
                children: [
                  Flexible(
                    child: CustomButton(
                      text: 'Start',
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                  UIHelper.horizontalSpace(10.0),
                  Flexible(
                    child: CustomButton(
                      text: 'Cancel',
                      invert: true,
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
