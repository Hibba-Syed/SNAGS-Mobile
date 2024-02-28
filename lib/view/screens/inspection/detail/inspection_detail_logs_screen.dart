import 'package:flutter/material.dart';
import 'package:iskaan_inspections_mobile/model/log_model.dart';
import 'package:iskaan_inspections_mobile/view/helper/ui_helper.dart';
import 'package:iskaan_inspections_mobile/view/screens/inspection/detail/components/inspection_detail_bottom_buttons.dart';
import 'package:iskaan_inspections_mobile/view/screens/inspection/detail/components/inspection_detail_logs_item_widget.dart';
import 'package:iskaan_inspections_mobile/view/widgets/empty_widget.dart';

class InspectionDetailLogsScreen extends StatelessWidget {
  final List<LogModel>? logs;
  const InspectionDetailLogsScreen({
    super.key,
    required this.logs,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: (logs?.isNotEmpty ?? false)
              ? ListView.separated(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 16.0, vertical: 14.0),
                  itemCount: logs?.length??0,
                  itemBuilder: (context, index) {
                    LogModel? log = logs?[index];
                    return  InspectionDetailLogsItemWidget(
                      text: log?.description??'--',
                      by: log?.logger?.name??'--',
                      status: log?.status??'--',
                      date: log?.createdAt??'--',
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
          onSubmitPressed: () {},
          onEditPressed: () {},
          onArchivePressed: () {},
        ),
        UIHelper.verticalSpace(10.0),
      ],
    );
  }
}
