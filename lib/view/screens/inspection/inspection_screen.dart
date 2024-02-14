import 'package:flutter/material.dart';
import 'package:iskaan_inspections_mobile/utils/routes/app_routes.dart';
import 'package:iskaan_inspections_mobile/view/helper/ui_helper.dart';
import 'package:iskaan_inspections_mobile/view/screens/inspection/components/inspection_widget.dart';
import 'package:iskaan_inspections_mobile/view/widgets/button/add_button_with_title.dart';
import 'package:iskaan_inspections_mobile/view/widgets/textfield/search_text_field.dart';
class InspectionScreen extends StatelessWidget {
  const InspectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0,vertical: 10.0),
            child: SearchTextField(
              onFilterPressed: () {},
            ),
          ),
          Expanded(
            child: ListView.separated(
              itemCount: 10,
              shrinkWrap: true,
              physics: const AlwaysScrollableScrollPhysics(),
              padding:
              const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
              itemBuilder: (context, index) {
                return  InspectionWidget(
                  reference: 'INS001-24-00003',
                  status: 'In Progress',
                  communityName: 'Al Attar Business Tower',
                  communityOwnerName: 'HOAM - Highrise Owners Association Management',
                  userName: 'Muhammad Talha Al Mehri',
                  date: 'May 08, 2023',
                  onTap: (){
                    Navigator.pushNamed(context, AppRoutes.inspectionDetail);
                  },
                );
              },
              separatorBuilder: (context, index) {
                return UIHelper.verticalSpace(10.0);
              },
            ),
          ),
        ],
      ),
      floatingActionButton: AddButtonWithTitle(
        title: 'Add Inspection',
        onTap: () {},
      ),
    );
  }
}
