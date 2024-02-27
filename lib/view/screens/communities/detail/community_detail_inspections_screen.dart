import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iskaan_inspections_mobile/bloc/communities/detail/community_detail_inspections/community_detail_inspections_cubit.dart';
import 'package:iskaan_inspections_mobile/model/inspection/inspections_response_model.dart';
import 'package:iskaan_inspections_mobile/utils/routes/app_routes.dart';
import 'package:iskaan_inspections_mobile/view/helper/ui_helper.dart';
import 'package:iskaan_inspections_mobile/view/screens/inspection/components/inspection_widget.dart';
import 'package:iskaan_inspections_mobile/view/widgets/button/add_button_with_title.dart';
import 'package:iskaan_inspections_mobile/view/widgets/custom_loader.dart';
import 'package:iskaan_inspections_mobile/view/widgets/empty_widget.dart';
import 'package:iskaan_inspections_mobile/view/widgets/textfield/search_text_field.dart';

class CommunityDetailInspectionsScreen extends StatelessWidget {
  const CommunityDetailInspectionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<CommunityDetailInspectionsCubit,
          CommunityDetailInspectionsState>(
        builder: (context, state) {
          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: SearchTextField(
                  onFilterPressed: () {},
                ),
              ),
              UIHelper.verticalSpace(16.0),
              Expanded(
                child: state.isLoading
                    ? const CustomLoader()
                    : (state.inspections?.isEmpty ?? true)
                        ? const EmptyWidget(
                            text: 'No Inspections found',
                          )
                        : ListView.separated(
                            itemCount: state.inspections?.length ?? 0,
                            shrinkWrap: true,
                            physics: const AlwaysScrollableScrollPhysics(),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16.0, vertical: 10.0),
                            itemBuilder: (context, index) {
                              InspectionModel item = state.inspections![index];
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
              ),
            ],
          );
        },
      ),
      floatingActionButton: AddButtonWithTitle(
        title: 'Add Inspection',
        onTap: () {
          Navigator.pushNamed(context, AppRoutes.addInspection);
        },
      ),
    );
  }
}
