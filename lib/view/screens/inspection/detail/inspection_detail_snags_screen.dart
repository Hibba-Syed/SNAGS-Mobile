import 'package:flutter/material.dart';
import 'package:iskaan_inspections_mobile/model/snag/snag_model.dart';
import 'package:iskaan_inspections_mobile/res/constants/constants.dart';
import 'package:iskaan_inspections_mobile/utils/routes/app_routes.dart';
import 'package:iskaan_inspections_mobile/view/helper/ui_helper.dart';
import 'package:iskaan_inspections_mobile/view/screens/snags/components/snag_widget.dart';
import 'package:iskaan_inspections_mobile/view/widgets/button/add_button_with_title.dart';
import 'package:iskaan_inspections_mobile/view/widgets/empty_widget.dart';
import 'package:iskaan_inspections_mobile/view/widgets/textfield/search_text_field.dart';

class InspectionDetailSnagsScreen extends StatelessWidget {
  final List<SnagModel>? snags;
  const InspectionDetailSnagsScreen({
    super.key,
    required this.snags,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: SearchTextField(
              onFilterPressed: () {},
            ),
          ),
          UIHelper.verticalSpace(16.0),
          Expanded(
            child: (snags?.isNotEmpty ?? false)
                ? ListView.separated(
                    itemCount: snags?.length??0,
                    shrinkWrap: true,
                    physics: const AlwaysScrollableScrollPhysics(),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16.0, vertical: 10.0),
                    itemBuilder: (context, index) {
                      SnagModel? snag = snags?[index];
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
                        title: snag?.title ?? '--',
                        description: snag?.description ?? '--',
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
