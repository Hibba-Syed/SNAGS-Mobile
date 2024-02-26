import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iskaan_inspections_mobile/bloc/snags/snags_cubit.dart';
import 'package:iskaan_inspections_mobile/model/snag/snags_response_model.dart';
import 'package:iskaan_inspections_mobile/utils/routes/app_routes.dart';
import 'package:iskaan_inspections_mobile/view/helper/ui_helper.dart';
import 'package:iskaan_inspections_mobile/view/screens/snags/components/snag_widget.dart';
import 'package:iskaan_inspections_mobile/view/widgets/button/add_button_with_title.dart';
import 'package:iskaan_inspections_mobile/view/widgets/custom_loader.dart';
import 'package:iskaan_inspections_mobile/view/widgets/empty_widget.dart';
import 'package:iskaan_inspections_mobile/view/widgets/textfield/search_text_field.dart';

class SnagsScreen extends StatelessWidget {
  const SnagsScreen({super.key});

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
                  onFilterPressed: () {},
                ),
              ),
              UIHelper.verticalSpace(16.0),
              Expanded(
                child: state.snags?.isNotEmpty ?? false
                    ? ListView.separated(
                        itemCount: state.snags?.length ?? 0,
                        shrinkWrap: true,
                        physics: const AlwaysScrollableScrollPhysics(),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16.0, vertical: 10.0),
                        itemBuilder: (context, index) {
                          SnagModel item = state.snags![index];
                          return SnagWidget(
                            imageUrl: item.images?.isNotEmpty ?? false
                                ? item.images?.first.path
                                : '',
                            reference: item.reference ?? '--',
                            risk: item.risk ?? '--',
                            status: item.status ?? '--',
                            title: item.title ?? '--',
                            description: item.description ?? '--',
                            onTap: () {
                              Navigator.pushNamed(
                                  context, AppRoutes.snagDetail);
                            },
                          );
                        },
                        separatorBuilder: (context, index) {
                          return UIHelper.verticalSpace(14.0);
                        },
                      )
                    : const EmptyWidget(
                        text: 'No Snags found',
                      ),
              ),
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
}
