import 'package:flutter/material.dart';
import 'package:iskaan_inspections_mobile/model/association/association_model.dart';
import 'package:iskaan_inspections_mobile/model/inspection/inspection_details_response_model.dart';
import 'package:iskaan_inspections_mobile/model/log_model.dart';
import 'package:iskaan_inspections_mobile/utils/routes/app_routes.dart';
import 'package:iskaan_inspections_mobile/view/helper/ui_helper.dart';
import 'package:iskaan_inspections_mobile/view/screens/inspection/detail/components/inspection_detail_bottom_buttons.dart';
import 'package:iskaan_inspections_mobile/view/screens/inspection/detail/components/inspection_detail_logs_item_widget.dart';
import 'package:iskaan_inspections_mobile/view/widgets/empty_widget.dart';

class InspectionDetailLogsScreen extends StatelessWidget {
  final InspectionDetails? inspectionDetails;
  final Association? community;
  const InspectionDetailLogsScreen({
    super.key,
    required this.inspectionDetails,
    this.community,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: (inspectionDetails?.logs?.isNotEmpty ?? false)
              ? ListView.separated(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 16.0, vertical: 14.0),
                  itemCount: inspectionDetails?.logs?.length ?? 0,
                  itemBuilder: (context, index) {
                    LogModel? log = inspectionDetails?.logs?[index];
                    return InspectionDetailLogsItemWidget(
                      text: log?.description ?? '--',
                      by: log?.logger?.name ?? '--',
                      status: log?.status ?? '--',
                      date: log?.createdAt ?? '--',
                    );
                  },
                  separatorBuilder: (context, index) {
                    return UIHelper.verticalSpace(14);
                  },
                )
              : const EmptyWidget(
                  text: 'No Logs found',
                ),
        ),
        InspectionDetailBottomButtons(
          status: inspectionDetails?.status??'',
          onSubmitPressed: () {},
          onEditPressed: () {
            Navigator.pushNamed(
              context,
              AppRoutes.editInspection,
              arguments: {
                'community': inspectionDetails?.association,//pass this to check if user is coming from specific community
                'inspection_details': inspectionDetails,
              },
            );
          },
          onArchivePressed: () {},
        ),
        UIHelper.verticalSpace(10.0),
      ],
    );
  }
}
