import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iskaan_inspections_mobile/bloc/inspection/add_edit/add_edit_inspection_cubit.dart';
import 'package:iskaan_inspections_mobile/bloc/inspection/inspection_cubit.dart';
import 'package:iskaan_inspections_mobile/model/inspection/inspections_response_model.dart';
import 'package:iskaan_inspections_mobile/utils/routes/app_routes.dart';
import 'package:iskaan_inspections_mobile/view/helper/ui_helper.dart';
import 'package:iskaan_inspections_mobile/view/screens/inspection/components/inspection_widget.dart';
import 'package:iskaan_inspections_mobile/view/widgets/button/add_button_with_title.dart';
import 'package:iskaan_inspections_mobile/view/widgets/custom_loader.dart';
import 'package:iskaan_inspections_mobile/view/widgets/empty_widget.dart';
import 'package:iskaan_inspections_mobile/view/widgets/textfield/search_text_field.dart';

import 'components/inspection_filter_bottom_sheet.dart';

class InspectionScreen extends StatefulWidget {
  const InspectionScreen({super.key});

  @override
  State<InspectionScreen> createState() => _InspectionScreenState();
}

class _InspectionScreenState extends State<InspectionScreen> {
  final ScrollController _scrollController = ScrollController();
  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels >=
          _scrollController.position.maxScrollExtent) {
        context.read<InspectionCubit>().getMoreInspection();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<InspectionCubit, InspectionState>(
        builder: (context, state) {
          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 16.0, vertical: 10.0),
                child: SearchTextField(
                  isFilterApplied: (state.selectedStatuses?.isEmpty ?? true) &&
                          (state.selectedCommunities?.isEmpty ?? true)
                      ? false
                      : true,
                  onFilterPressed: () {
                    _inspectionFilterBottomSheet(context);
                  },
                ),
              ),
              Expanded(
                child: state.isLoading == true
                    ? const CustomLoader()
                    : state.inspections?.isNotEmpty ?? false
                        ? RefreshIndicator(
                            onRefresh: () async {
                              await context
                                  .read<InspectionCubit>()
                                  .getInspections();
                            },
                            child: ListView.separated(
                              itemCount: state.inspections?.length ?? 0,
                              controller: _scrollController,
                              shrinkWrap: true,
                              physics: const AlwaysScrollableScrollPhysics(),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 16.0, vertical: 10.0),
                              itemBuilder: (context, index) {
                                InspectionModel item =
                                    state.inspections![index];
                                return InspectionWidget(
                                  id: item.id,
                                  reference: item.reference ?? '--',
                                  status: item.status ?? '--',
                                  communityName: item.association?.name ?? '--',
                                  companyName: item.company?.name ?? '',
                                  userName: item.inspector?.fullName ?? '--',
                                  date: item.updatedAt ?? item.createdAt,
                                );
                              },
                              separatorBuilder: (context, index) {
                                return UIHelper.verticalSpace(10.0);
                              },
                            ),
                          )
                        : const EmptyWidget(text: 'No Inspections found'),
              ),
              if (state.loadMore) const CustomLoader(),
            ],
          );
        },
      ),
      floatingActionButton: AddButtonWithTitle(
        title: 'Add Inspection',
        onTap: () {
          context.read<AddEditInspectionCubit>().clearData();
          Navigator.pushNamed(context, AppRoutes.addInspection);
        },
      ),
    );
  }

  _inspectionFilterBottomSheet(context) {
    showModalBottomSheet(
      //isScrollControlled: true,
      context: context,
      barrierColor: Colors.transparent,
      builder: (context) {
        return const InspectionFilterBottomSheet();
      },
    );
  }
}
