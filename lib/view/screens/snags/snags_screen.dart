import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iskaan_inspections_mobile/bloc/snags/snag_detail/snag_detail_cubit.dart';
import 'package:iskaan_inspections_mobile/bloc/snags/snags_cubit.dart';
import 'package:iskaan_inspections_mobile/model/snag/snag_model.dart';
import 'package:iskaan_inspections_mobile/res/constants/constants.dart';
import 'package:iskaan_inspections_mobile/utils/routes/app_routes.dart';
import 'package:iskaan_inspections_mobile/view/helper/ui_helper.dart';
import 'package:iskaan_inspections_mobile/view/screens/snags/components/snag_widget.dart';
import 'package:iskaan_inspections_mobile/view/widgets/button/add_button_with_title.dart';
import 'package:iskaan_inspections_mobile/view/widgets/custom_loader.dart';
import 'package:iskaan_inspections_mobile/view/widgets/empty_widget.dart';
import 'package:iskaan_inspections_mobile/view/widgets/textfield/search_text_field.dart';

import 'components/snags_filter_bottom_sheet.dart';

class SnagsScreen extends StatefulWidget {
  const SnagsScreen({super.key});

  @override
  State<SnagsScreen> createState() => _SnagsScreenState();
}

class _SnagsScreenState extends State<SnagsScreen> {
  final ScrollController _scrollController = ScrollController();
  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels >=
          _scrollController.position.maxScrollExtent) {
        context.read<SnagsCubit>().getMoreSnags();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<SnagsCubit, SnagsState>(
        builder: (context, state) {
          if (state.isLoading == true) {
            return const CustomLoader();
          }
          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: SearchTextField(
                  isFilterApplied: (state.selectedStatuses?.isEmpty ?? true) &&
                          (state.selectedCommunities?.isEmpty ?? true)
                      ? false
                      : true,
                  onFilterPressed: () {
                    _snagsFilterBottomSheet(context);
                  },
                ),
              ),
              UIHelper.verticalSpace(16.0),
              Expanded(
                child: state.snags?.isNotEmpty ?? false
                    ? RefreshIndicator(
                        onRefresh: () async {
                          await context.read<SnagsCubit>().getSnags();
                        },
                        child: ListView.separated(
                          itemCount: state.snags?.length ?? 0,
                          controller: _scrollController,
                          shrinkWrap: true,
                          physics: const AlwaysScrollableScrollPhysics(),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16.0, vertical: 10.0),
                          itemBuilder: (context, index) {
                            SnagModel? snag = state.snags?[index];
                            return SnagWidget(
                              id: snag?.id,
                              imageUrl: (snag?.status ==
                                          AppConstants.snagCompleted.title ||
                                      snag?.status ==
                                          AppConstants.snagCancelled.title)
                                  ? snag?.closingImages?.isNotEmpty ?? false
                                      ? snag?.closingImages?.first.path
                                      : ''
                                  : snag?.images?.isNotEmpty ?? false
                                      ? snag?.images?.first.path
                                      : '',
                              reference: snag?.reference ?? '--',
                              risk: snag?.risk ?? '--',
                              status: snag?.status ?? '--',
                              title: snag?.description ?? '--',
                              location: snag?.location ?? '--',
                              onTap: (){
                                if (snag?.id != null) {
                                  context.read<SnagDetailCubit>().onChangeCarouselIndex(0);
                                  context.read<SnagDetailCubit>().getSnagDetails(id: snag!.id!);
                                }
                                context.read<SnagDetailCubit>().onChangeReference(snag?.reference);
                                Navigator.pushNamed(
                                  context,
                                  AppRoutes.snagDetail,
                                  arguments: {
                                    'is_from_community': false,
                                  },
                                );
                              },
                            );
                          },
                          separatorBuilder: (context, index) {
                            return UIHelper.verticalSpace(14.0);
                          },
                        ),
                      )
                    : const EmptyWidget(
                        text: 'No Snags found',
                      ),
              ),
              if (state.loadMore) const CustomLoader(),
            ],
          );
        },
      ),
      floatingActionButton: AddButtonWithTitle(
        title: 'Add Snag',
        onTap: () {
          Navigator.pushNamed(context, AppRoutes.addSnag);
        },
      ),
    );
  }

  _snagsFilterBottomSheet(context) {
    showModalBottomSheet(
      //isScrollControlled: true,
      context: context,
      barrierColor: Colors.transparent,
      builder: (context) {
        return const SnagsFilterBottomSheet();
      },
    );
  }
}
