import 'package:flutter/material.dart';
import 'package:iskaan_inspections_mobile/res/constants/app_colors.dart';
import 'package:iskaan_inspections_mobile/view/helper/ui_helper.dart';
import 'package:iskaan_inspections_mobile/view/screens/inspection/components/inspection_category_widget.dart';
import 'package:iskaan_inspections_mobile/view/screens/inspection/components/model/inspection_category_item_model.dart';
import 'package:iskaan_inspections_mobile/view/widgets/app_bar/appbar_widget.dart';
import 'package:iskaan_inspections_mobile/view/widgets/dropdown/dropdown_widget.dart';

class AddInspectionScreen extends StatefulWidget {
  const AddInspectionScreen({super.key});

  @override
  State<AddInspectionScreen> createState() => _AddInspectionScreenState();
}

class _AddInspectionScreenState extends State<AddInspectionScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWidget(
        title: 'Add Inspection',
        isNotificationEnabled: false,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            DropdownWidget<String>(
              hint: 'Select a Community',
              selectedItem: null,
              items: const ['A', 'B', 'C'],
              onChanged: (value) {},
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide: BorderSide.none,
              ),
              icon: const Icon(
                Icons.keyboard_arrow_down,
                color: AppColors.lightGrey,
              ),
            ),
            UIHelper.verticalSpace(10.0),
            InspectionCategoryWidget(
              categoryTitle: 'General Appearance',
              inspectionCategoryItems: [
                InspectionCategoryItemModel(
                  title: 'Building Exteriors',
                ),
                InspectionCategoryItemModel(
                  title:
                      'Condition of paintwork, siding, cladding or brickwork',
                ),
                InspectionCategoryItemModel(
                  title: 'Some other work',
                ),
              ],
              onCategoryItemNoteChanged: (index, value) {},
              onCategoryItemRatingUpdate: (index, value) {},
              onCategoryNoteChanged: (value) {},
              onSavePressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
