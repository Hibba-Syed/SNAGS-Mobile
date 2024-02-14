import 'package:flutter/material.dart';
import 'package:iskaan_inspections_mobile/res/constants/app_colors.dart';
import 'package:iskaan_inspections_mobile/res/styles/styles.dart';
import 'package:iskaan_inspections_mobile/view/helper/ui_helper.dart';
import 'package:iskaan_inspections_mobile/view/screens/snags/components/snag_detail_container.dart';
import 'package:iskaan_inspections_mobile/view/screens/snags/components/snag_detail_item_widget.dart';
import 'package:iskaan_inspections_mobile/view/widgets/app_bar/appbar_widget.dart';
import 'package:iskaan_inspections_mobile/view/widgets/risk_widget.dart';
import 'package:iskaan_inspections_mobile/view/widgets/status_widget.dart';

class SnagDetailScreen extends StatelessWidget {
  const SnagDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWidget(
        title: 'SN001-24-00011',
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SnagDetailContainer(
              header: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    'SN001-24-00011',
                    style: AppTextStyles.style16Grey600,
                  ),
                  UIHelper.horizontalSpace(8.0),
                  const StatusWidget(
                    status: 'Completed',
                    color: AppColors.green,
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SnagDetailItemWidget(
                    title: 'Description',
                    value: 'Door Glass Broken',
                  ),
                  const SnagDetailItemWidget(
                    title: 'Community Management Company',
                    value: 'HOAM - Highrise Owners Association Management',
                  ),
                  const SnagDetailItemWidget(
                    title: 'Community',
                    value: 'Al Atar Business Tower',
                  ),
                  const SnagDetailItemWidget(
                    title: 'Reported By',
                    value: 'Shuber Ali Mirza',
                  ),
                  const SnagDetailItemWidget(
                    title: 'Location',
                    value: 'Back Entrance of the Building',
                  ),
                  const SnagDetailItemWidget(
                    title: 'Risk',
                    widget: RiskWidget(
                      risk: 'High Risk',
                      color: AppColors.red,
                    ),
                  ),
                  const SnagDetailItemWidget(
                    title: 'Created At',
                    value: 'Jan 5, 2024, 10:46:11 AM',
                  ),
                  const SnagDetailItemWidget(
                    title: 'Last Update At',
                    value: 'Jan 12, 2024, 2:14:34 PM',
                  ),
                  const SnagDetailItemWidget(
                    title: 'Additional Notes',
                    value:
                        'Need to replace the glass ASAP as it is very dangerous for the community members.',
                  ),
                  const Text(
                    'Snag Images',
                    style: AppTextStyles.style12LightGrey400,
                  ),
                  UIHelper.verticalSpace(4.0),
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: 100,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      itemCount: 5,
                      itemBuilder: (context, index) {
                        return Container(
                          width: 100,
                          height: 100,
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          decoration: BoxDecoration(
                            color: Colors.grey.shade200,
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          child: Image.network(
                            '',
                            errorBuilder: (context, object, stackTrace) {
                              return const Icon(
                                Icons.image_outlined,
                                color: AppColors.lightGrey,
                              );
                            },
                          ),
                        );
                      },
                      separatorBuilder: (context, index) {
                        return UIHelper.horizontalSpace(10.0);
                      },
                    ),
                  ),
                  UIHelper.verticalSpace(10.0),
                  const SnagDetailItemWidget(
                    title: 'Completion Notes',
                    value:
                        'Thank you for reporting the snag, We fixed the door and it is good as new.',
                  ),
                  const Text(
                    'Completion Images',
                    style: AppTextStyles.style12LightGrey400,
                  ),
                  UIHelper.verticalSpace(4.0),
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: 100,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      itemCount: 5,
                      itemBuilder: (context, index) {
                        return Container(
                          width: 100,
                          height: 100,
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          decoration: BoxDecoration(
                            color: Colors.grey.shade200,
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          child: Image.network(
                            '',
                            errorBuilder: (context, object, stackTrace) {
                              return const Icon(
                                Icons.image_outlined,
                                color: AppColors.lightGrey,
                              );
                            },
                          ),
                        );
                      },
                      separatorBuilder: (context, index) {
                        return UIHelper.horizontalSpace(10.0);
                      },
                    ),
                  ),
                  UIHelper.verticalSpace(10.0),
                ],
              ),
            ),
            const SnagDetailContainer(
              header: Text(
                'Connected Inspection',
                style: AppTextStyles.style16Grey600,
              ),
              child: Column(
                children: [
                  SnagDetailItemWidget(
                    title: 'Reference',
                    value: 'INS001-23-00001',
                  ),
                  SnagDetailItemWidget(
                    title: 'Status',
                    widget: StatusWidget(
                        status: 'In Progress', color: AppColors.yellow),
                  ),
                  SnagDetailItemWidget(
                    title: 'Status',
                    value: 'Jan 30, 2024, 3:45:44 PM',
                  ),
                  SnagDetailItemWidget(
                    title: 'Status',
                    value: 'No Score Given',
                  ),
                ],
              ),
            ),
            const SnagDetailContainer(
              header: Text(
                'Comments',
                style: AppTextStyles.style16Grey600,
              ),
              child: SizedBox(),
            ),
            const SnagDetailContainer(
              header: Text(
                'Logs',
                style: AppTextStyles.style16Grey600,
              ),
              child: SizedBox(),
            ),
          ],
        ),
      ),
    );
  }
}
