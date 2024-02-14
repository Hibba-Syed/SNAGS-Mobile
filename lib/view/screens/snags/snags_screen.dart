import 'package:flutter/material.dart';
import 'package:iskaan_inspections_mobile/utils/routes/app_routes.dart';
import 'package:iskaan_inspections_mobile/view/helper/ui_helper.dart';
import 'package:iskaan_inspections_mobile/view/screens/snags/components/snag_widget.dart';
import 'package:iskaan_inspections_mobile/view/widgets/button/add_button_with_title.dart';
import 'package:iskaan_inspections_mobile/view/widgets/textfield/search_text_field.dart';
class SnagsScreen extends StatelessWidget {
  const SnagsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
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
            child: ListView.separated(
              itemCount: 10,
              shrinkWrap: true,
              physics: const AlwaysScrollableScrollPhysics(),
              padding:
              const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
              itemBuilder: (context, index) {
                return  SnagWidget(
                  imageUrl: '',
                  reference: 'INS001-24-00003',
                  risk: 'High Risk',
                  status: 'In Progress',
                  title: 'Door Glass Broken',
                  description: 'The glass of the back entrance of the building is crack and it is dangerous for the people of the community.',
                  onTap: (){
                    Navigator.pushNamed(context, AppRoutes.snagDetail);
                  },
                );
              },
              separatorBuilder: (context, index) {
                return UIHelper.verticalSpace(14.0);
              },
            ),
          ),
        ],
      ),
      floatingActionButton: AddButtonWithTitle(
        title: 'Add Snag',
        onTap: () {},
      ),
    );
  }
}

