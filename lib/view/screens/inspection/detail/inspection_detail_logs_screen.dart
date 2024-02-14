import 'package:flutter/material.dart';
import 'package:iskaan_inspections_mobile/res/constants/app_colors.dart';
import 'package:iskaan_inspections_mobile/view/helper/ui_helper.dart';
import 'package:iskaan_inspections_mobile/view/screens/inspection/detail/components/inspection_detail_bottom_buttons.dart';
import 'package:iskaan_inspections_mobile/view/screens/inspection/detail/components/inspection_detail_logs_item_widget.dart';
import 'package:iskaan_inspections_mobile/view/widgets/button/custom_button.dart';

class InspectionDetailLogsScreen extends StatelessWidget {
  const InspectionDetailLogsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView.separated(
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 14.0),
            itemCount: 10,
            itemBuilder: (context, index) {
              return const InspectionDetailLogsItemWidget(
                text: 'Inspection created by',
                by: 'Shuber Ali Mirza',
                status: 'Created',
                date: 'Jan 26, 2024, 12:27 PM',
              );
            },
            separatorBuilder: (context, index) {
              return UIHelper.verticalSpace(14);
            },
          ),
        ),
        InspectionDetailBottomButtons(
          onSubmitPressed: (){},
          onEditPressed: (){},
          onDeletePressed: (){},
        ),
        UIHelper.verticalSpace(10.0),
      ],
    );
  }
}
