import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:iskaan_inspections_mobile/bloc/snags/snag_detail/snag_detail_cubit.dart';
import 'package:iskaan_inspections_mobile/model/image_model.dart';
import 'package:iskaan_inspections_mobile/model/snag/snag_model.dart';
import 'package:iskaan_inspections_mobile/res/constants/app_colors.dart';
import 'package:iskaan_inspections_mobile/res/constants/constants.dart';
import 'package:iskaan_inspections_mobile/res/styles/styles.dart';
import 'package:iskaan_inspections_mobile/view/helper/ui_helper.dart';
import 'package:iskaan_inspections_mobile/view/screens/snags/MergeSnag/components/selected_snag_for_merge_item_widget.dart';
import 'package:iskaan_inspections_mobile/view/screens/snags/MergeSnag/components/snag_to_merge_item_widget.dart';
import 'package:iskaan_inspections_mobile/view/screens/snags/components/snag_detail_item_widget.dart';
import 'package:iskaan_inspections_mobile/view/screens/snags/components/snag_image_index_bar.dart';
import 'package:iskaan_inspections_mobile/view/screens/snags/components/snag_image_status_widget.dart';
import 'package:iskaan_inspections_mobile/view/widgets/app_bar/appbar_widget.dart';
import 'package:iskaan_inspections_mobile/view/widgets/button/custom_button.dart';
import 'package:iskaan_inspections_mobile/view/widgets/custom_loader.dart';
import 'package:iskaan_inspections_mobile/view/widgets/empty_widget.dart';
import 'package:iskaan_inspections_mobile/view/widgets/image/network_image_widget.dart';
import 'package:iskaan_inspections_mobile/view/widgets/risk_widget.dart';
import 'package:iskaan_inspections_mobile/view/widgets/status/snag_status_widget.dart';
import 'package:iskaan_inspections_mobile/view/widgets/textfield/search_text_field.dart';
import 'package:iskaan_inspections_mobile/view/widgets/textfield/text_field_widget.dart';

class MergeSnagScreen extends StatelessWidget {
   MergeSnagScreen({super.key});
  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SnagDetailCubit, SnagDetailState>(
      builder: (ctx, state) {
        return Scaffold(
          appBar: AppBarWidget(
            title: 'Merge (${state.reference})',
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
                                              Container(
                                                width: MediaQuery.of(context)
                                                    .size
                                                    .width,
                                                height: MediaQuery.of(context)
                                                        .size
                                                        .width /
                                                    2,
                                                clipBehavior:
                                                    Clip.antiAliasWithSaveLayer,
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5.0)),
                                                child:
                                                    (state.snagDetails?.images
                                                                ?.isNotEmpty ??
                                                            false)
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
                                                                items: state
                                                                    .snagDetails
                                                                    ?.images
                                                                    ?.map((i) {
                                                                  return Builder(
                                                                    builder:
                                                                        (BuildContext
                                                                            context) {
                                                                      return Container(
                                                                        width: MediaQuery.of(context)
                                                                            .size
                                                                            .width,
                                                                        height:
                                                                            MediaQuery.of(context).size.width /
                                                                                2,
                                                                        clipBehavior:
                                                                            Clip.antiAliasWithSaveLayer,
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          color: Colors
                                                                              .grey
                                                                              .shade200,
                                                                          borderRadius:
                                                                              BorderRadius.circular(5.0),
                                                                        ),
                                                                        child:
                                                                            NetworkImageWidget(
                                                                          url: i
                                                                              .path,
                                                                        ),
                                                                      );
                                                                    },
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
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                UIHelper.verticalSpace(16.0),
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
                                      const Text(
                                        'Snag(s) to Merge into Selected Snag',
                                        style: AppTextStyles.style20Grey600,
                                      ),
                                      UIHelper.verticalSpace(16.0),
                                      (state.selectedSnagsToMerge?.isNotEmpty ??
                                              false)
                                          ? ListView.separated(
                                              itemCount: state
                                                      .selectedSnagsToMerge
                                                      ?.length ??
                                                  0,
                                              physics:
                                                  const NeverScrollableScrollPhysics(),
                                              shrinkWrap: true,
                                              itemBuilder: (context, index) {
                                                SnagModel? item =
                                                    state.selectedSnagsToMerge?[
                                                        index];
                                                return Builder(
                                                  builder: (context) {
                                                    List<ImageModel> images =
                                                        [];
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
                                                      images =
                                                          item?.closingImages ??
                                                              [];
                                                    } else {
                                                      images =
                                                          item?.images ?? [];
                                                    }
                                                    return SelectedSnagForMergeItemWidget(
                                                      reference:
                                                          item?.reference ??
                                                              '--',
                                                      title:
                                                          item?.title ?? '--',
                                                      description:
                                                          item?.description ??
                                                              '--',
                                                      imagesUrls: images
                                                          .map((e) =>
                                                              e.path ?? '')
                                                          .toList(),
                                                      createdAt:
                                                          item?.createdAt,
                                                      onRemovePressed: () {
                                                        if (item != null) {
                                                          context
                                                              .read<
                                                                  SnagDetailCubit>()
                                                              .removeItemFromSelectedSnags(
                                                                  item);
                                                        }
                                                      },
                                                    );
                                                  },
                                                );
                                              },
                                              separatorBuilder:
                                                  (context, index) {
                                                return UIHelper.verticalSpace(
                                                    6.0);
                                              },
                                            )
                                          : const Column(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                Icon(
                                                  Icons.save_alt,
                                                  color: AppColors.grey,
                                                ),
                                                EmptyWidget(
                                                  text:
                                                      'Please select the snag to merge',
                                                ),
                                              ],
                                            ),
                                    ],
                                  ),
                                ),
                                UIHelper.verticalSpace(16.0),
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
                                    children: [
                                      const Text(
                                        'Search Snag to Merge',
                                        style: AppTextStyles.style20Grey600,
                                      ),
                                      UIHelper.verticalSpace(16.0),
                                      SearchTextField(
                                        controller: _searchController,
                                        fillColor: Colors.grey.shade100,
                                        onFieldSubmitted: (value) {
                                          print(state.snagDetails?.association
                                              ?.id);
                                          if (value.trim().isNotEmpty &&
                                              state.snagDetails?.association
                                                      ?.id !=
                                                  null) {
                                            context
                                                .read<SnagDetailCubit>()
                                                .getSnags(
                                                    keyword: value,
                                                    communityId: state
                                                        .snagDetails!
                                                        .association!
                                                        .id!);
                                          }
                                        },
                                      ),
                                      UIHelper.verticalSpace(10.0),
                                      Stack(
                                        alignment: Alignment.center,
                                        children: [
                                          (state.snagsToMerge?.isNotEmpty ??
                                                  false)
                                              ? ListView.separated(
                                                  itemCount: state.snagsToMerge
                                                          ?.length ??
                                                      0,
                                                  physics:
                                                      const NeverScrollableScrollPhysics(),
                                                  shrinkWrap: true,
                                                  itemBuilder:
                                                      (context, index) {
                                                    SnagModel? item = state
                                                        .snagsToMerge?[index];
                                                    return Builder(
                                                      builder: (context) {
                                                        List<ImageModel>
                                                            images = [];
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
                                                          images =
                                                              item?.closingImages ??
                                                                  [];
                                                        } else {
                                                          images =
                                                              item?.images ??
                                                                  [];
                                                        }
                                                        return SnagToMergeItemWidget(
                                                          reference:
                                                              item?.reference ??
                                                                  '--',
                                                          createdAt:
                                                              item?.createdAt,
                                                          title: item?.title ??
                                                              '--',
                                                          imagesUrls: images
                                                              .map((e) =>
                                                                  e.path ?? '')
                                                              .toList(),
                                                          onAddPressed: () {
                                                            if (item != null) {
                                                              context
                                                                  .read<
                                                                      SnagDetailCubit>()
                                                                  .addItemIntoSelectedSnag(
                                                                      item);
                                                            }
                                                          },
                                                        );
                                                      },
                                                    );
                                                  },
                                                  separatorBuilder:
                                                      (context, index) {
                                                    return UIHelper
                                                        .verticalSpace(6.0);
                                                  },
                                                )
                                              : const EmptyWidget(
                                                  text:
                                                      'No Snags found, search snag',
                                                ),
                                          Visibility(
                                            visible:
                                                state.isSnagsToMergeLoading,
                                            child: const CustomLoader(),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 16.0, vertical: 20.0),
                                  child: state.isMergeLoading
                                      ? const CustomLoader()
                                      : CustomButton(
                                          icon: const Icon(
                                            Icons.merge,
                                            color: AppColors.white,
                                          ),
                                          text: 'Merge',
                                          textColor: AppColors.white,
                                          buttonColor: AppColors.primary,
                                          onPressed: () {
                                            if (state.selectedSnagsToMerge
                                                    ?.isEmpty ??
                                                true) {
                                              Fluttertoast.showToast(
                                                  msg:
                                                      'Please select snags to merge');
                                              return;
                                            }
                                            _showMergeSnagDialog(
                                                context, state);
                                          },
                                        ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
        );
      },
    );
  }

  _showMergeSnagDialog(BuildContext context, SnagDetailState state) {
    final GlobalKey<FormState> noteFormKey = GlobalKey();
    final TextEditingController noteController = TextEditingController();
    showDialog(
      context: context,
      builder: (ctx) {
        return AlertDialog(
          backgroundColor: AppColors.white,
          content: Form(
            key: noteFormKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextFieldWidget(
                  controller: noteController,
                  label: 'Add Note',
                  hint: 'Write note',
                  validator: (value) {
                    if (value?.isEmpty ?? true) {
                      return 'required';
                    }
                    return null;
                  },
                ),
                UIHelper.verticalSpace(20.0),
                CustomButton(
                  icon: const Icon(
                    Icons.merge,
                    color: AppColors.white,
                  ),
                  text: 'Merge',
                  textColor: AppColors.white,
                  buttonColor: AppColors.primary,
                  onPressed: () {
                    if (noteFormKey.currentState?.validate() ?? false) {
                      Navigator.pop(context);
                      context.read<SnagDetailCubit>().mergeSnags(
                            context,
                            snagId: state.snagDetails?.id,
                            snagsToMergeIds: state.selectedSnagsToMerge
                                    ?.map((e) => e.id!)
                                    .toList() ??
                                [],
                            note: noteController.text,
                          );
                    }
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
