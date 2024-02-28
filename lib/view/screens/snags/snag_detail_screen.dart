import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iskaan_inspections_mobile/bloc/snags/snag_detail/snag_detail_cubit.dart';
import 'package:iskaan_inspections_mobile/model/log_model.dart';
import 'package:iskaan_inspections_mobile/model/snag/snag_details_response_model.dart';
import 'package:iskaan_inspections_mobile/res/constants/app_colors.dart';
import 'package:iskaan_inspections_mobile/res/constants/constants.dart';
import 'package:iskaan_inspections_mobile/res/styles/styles.dart';
import 'package:iskaan_inspections_mobile/view/helper/ui_helper.dart';
import 'package:iskaan_inspections_mobile/view/screens/snags/components/snag_detail_container.dart';
import 'package:iskaan_inspections_mobile/view/screens/snags/components/snag_detail_item_widget.dart';
import 'package:iskaan_inspections_mobile/view/screens/snags/components/snag_image_index_bar.dart';
import 'package:iskaan_inspections_mobile/view/screens/snags/components/snag_image_status_widget.dart';
import 'package:iskaan_inspections_mobile/view/widgets/app_bar/appbar_widget.dart';
import 'package:iskaan_inspections_mobile/view/widgets/custom_loader.dart';
import 'package:iskaan_inspections_mobile/view/widgets/empty_widget.dart';
import 'package:iskaan_inspections_mobile/view/widgets/image/network_image_widget.dart';
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
                  : SingleChildScrollView(
                      child: Column(
                        children: [
                          SnagDetailContainer(
                            header: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  state.snagDetails?.reference ?? '--',
                                  style: AppTextStyles.style16Grey600,
                                ),
                                UIHelper.horizontalSpace(8.0),
                                SnagStatusWidget(
                                  status: state.snagDetails?.status ?? '--',
                                ),
                              ],
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Column(
                                  children: [
                                    Container(
                                      width: MediaQuery.of(context).size.width,
                                      height:
                                          MediaQuery.of(context).size.width / 2,
                                      clipBehavior: Clip.antiAliasWithSaveLayer,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(5.0)),
                                      child: (state.snagDetails?.images
                                                  ?.isNotEmpty ??
                                              false)
                                          ? Stack(
                                              children: [
                                                CarouselSlider(
                                                  options: CarouselOptions(
                                                    autoPlay: true,
                                                    viewportFraction: 1,
                                                    onPageChanged:
                                                        (index, reason) {
                                                      context
                                                          .read<
                                                              SnagDetailCubit>()
                                                          .onChangeCarouselIndex(
                                                              index);
                                                    },
                                                  ),
                                                  items: state
                                                      .snagDetails?.images
                                                      ?.map((i) {
                                                    return Builder(
                                                      builder: (BuildContext
                                                          context) {
                                                        return Container(
                                                          width: MediaQuery.of(
                                                                  context)
                                                              .size
                                                              .width,
                                                          height: MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .width /
                                                              2,
                                                          clipBehavior: Clip
                                                              .antiAliasWithSaveLayer,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: Colors
                                                                .grey.shade200,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5.0),
                                                          ),
                                                          child: Image.network(
                                                            i.path ?? '',
                                                            errorBuilder:
                                                                (context,
                                                                    object,
                                                                    stackTrace) {
                                                              return const Icon(
                                                                Icons
                                                                    .image_outlined,
                                                                color: AppColors
                                                                    .lightGrey,
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
                                                    status: state.snagDetails
                                                            ?.status ??
                                                        '--',
                                                  ),
                                                ),
                                                if (state.snagDetails?.images
                                                        ?.isNotEmpty ??
                                                    false)
                                                  Positioned(
                                                    right: 8.0,
                                                    bottom: 8.0,
                                                    child: Container(
                                                      padding: const EdgeInsets
                                                          .symmetric(
                                                          horizontal: 6.0,
                                                          vertical: 3.0),
                                                      decoration: BoxDecoration(
                                                        color: AppColors.black
                                                            .withOpacity(0.4),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(5.0),
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
                                              text: 'No Images found',
                                            ),
                                    ),
                                    UIHelper.verticalSpace(10.0),
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width,
                                      height: 8.0,
                                      child: Align(
                                        alignment: Alignment.center,
                                        child: ListView.separated(
                                          itemCount: state.snagDetails?.images
                                                  ?.length ??
                                              0,
                                          scrollDirection: Axis.horizontal,
                                          shrinkWrap: true,
                                          itemBuilder: (context, index) {
                                            return SnagImageIndexBar(
                                                isSelected: index ==
                                                    state.carouselIndex);
                                          },
                                          separatorBuilder: (context, index) {
                                            return UIHelper.horizontalSpace(
                                                2.0);
                                          },
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                SnagDetailItemWidget(
                                  title: 'Description',
                                  value: state.snagDetails?.description ?? '--',
                                ),
                                SnagDetailItemWidget(
                                  title: 'Community Management Company',
                                  value:
                                      state.snagDetails?.company?.name ?? '--',
                                ),
                                SnagDetailItemWidget(
                                  title: 'Community',
                                  value: state.snagDetails?.association?.name ??
                                      '--',
                                ),
                                SnagDetailItemWidget(
                                  title: 'Reported By',
                                  value:
                                      state.snagDetails?.inspector?.fullName ??
                                          '--',
                                ),
                                SnagDetailItemWidget(
                                  title: 'Location',
                                  value: state.snagDetails?.location ?? '--',
                                ),
                                SnagDetailItemWidget(
                                  title: 'Risk',
                                  widget: RiskWidget(
                                    risk: state.snagDetails?.risk ?? '--',
                                  ),
                                ),
                                SnagDetailItemWidget(
                                  title: 'Created At',
                                  value: state.snagDetails?.createdAt ?? '--',
                                ),
                                SnagDetailItemWidget(
                                  title: 'Last Update At',
                                  value: state.snagDetails?.updatedAt ?? '--',
                                ),
                                SnagDetailItemWidget(
                                    title: 'Additional Notes',
                                    value:
                                        state.snagDetails?.description ?? '--'),
                                UIHelper.verticalSpace(10.0),
                                if (state.snagDetails?.status ==
                                    AppConstants.snagCompleted.title)
                                  const SnagDetailItemWidget(
                                    title: 'Completion Notes',
                                    value: 'state.snagDetails?.completionNotes',
                                  ),
                                if (state.snagDetails?.status ==
                                    AppConstants.snagCompleted.title)
                                  UIHelper.verticalSpace(10.0),
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
                                        value: state.snagDetails?.inspection
                                                ?.reference ??
                                            '--',
                                      ),
                                      SnagDetailItemWidget(
                                        title: 'Status',
                                        widget: Flexible(
                                          child: InspectionStatusWidget(
                                            status: state.snagDetails
                                                    ?.inspection?.status ??
                                                '--',
                                          ),
                                        ),
                                      ),
                                      SnagDetailItemWidget(
                                        title: 'Last Updated At',
                                        value: (state.snagDetails?.inspection
                                                    ?.updatedAt?.isNotEmpty ??
                                                false)
                                            ? state.snagDetails?.inspection
                                                ?.updatedAt
                                            : state.snagDetails?.inspection
                                                ?.createdAt,
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
                            child: (state.snagDetails?.comments?.isNotEmpty ??
                                    false)
                                ? Column(
                                    children: [
                                      ListView.separated(
                                        itemCount: state.snagDetails?.comments
                                                ?.length ??
                                            0,
                                        shrinkWrap: true,
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 8.0),
                                        itemBuilder: (context, index) {
                                          Comment item = state
                                              .snagDetails!.comments![index];
                                          return Container(
                                            padding: const EdgeInsets.all(8.0),
                                            decoration: BoxDecoration(
                                                border: Border.all(
                                                    color:
                                                        AppColors.lightGrey)),
                                            child: Row(
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
                                                UIHelper.horizontalSpace(10.0),
                                                Expanded(
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        item.commenter?.name ??
                                                            '--',
                                                        style: AppTextStyles
                                                            .style14Grey600,
                                                      ),
                                                      UIHelper.verticalSpace(
                                                          5.0),
                                                      Text(
                                                        item.comment ?? '--',
                                                        style: AppTextStyles
                                                            .style10LightGrey400,
                                                      ),
                                                      Align(
                                                        alignment: Alignment
                                                            .bottomRight,
                                                        child: Text(
                                                          item.createdAt ??
                                                              '--',
                                                          style: AppTextStyles
                                                              .style12LightGrey400,
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
                                        state.snagDetails?.logs?.length ?? 0,
                                    shrinkWrap: true,
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 8.0),
                                    itemBuilder: (context, index) {
                                      LogModel item =
                                          state.snagDetails!.logs![index];
                                      return Container(
                                        padding: const EdgeInsets.all(8.0),
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                                color: AppColors.lightGrey)),
                                        child: Row(
                                          children: [
                                            NetworkImageWidget(
                                              width: 40.0,
                                              height: 40.0,
                                              url: item.logger?.profilePicture,
                                              shape: BoxShape.circle,
                                              placeHolder: const Icon(
                                                Icons.person,
                                                color: AppColors.grey,
                                              ),
                                            ),
                                            UIHelper.horizontalSpace(10.0),
                                            Expanded(
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  RichText(
                                                    text: TextSpan(
                                                      text: item.description ??
                                                          '--',
                                                      style: AppTextStyles
                                                          .style12LightGrey400,
                                                      children: [
                                                        TextSpan(
                                                            text: item
                                                                .logger?.name,
                                                            style: AppTextStyles
                                                                .style14Primary600),
                                                      ],
                                                    ),
                                                  ),
                                                  UIHelper.verticalSpace(5.0),
                                                  Text(
                                                    item.createdAt ?? '--',
                                                    style: AppTextStyles
                                                        .style12LightGrey400,
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
                                  )
                                : const EmptyWidget(
                                    text: 'No Logs found',
                                  ),
                          ),
                        ],
                      ),
                    ),
        );
      },
    );
  }
}
