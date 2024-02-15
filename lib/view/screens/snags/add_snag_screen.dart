import 'package:flutter/material.dart';
import 'package:iskaan_inspections_mobile/res/constants/app_colors.dart';
import 'package:iskaan_inspections_mobile/res/styles/styles.dart';
import 'package:iskaan_inspections_mobile/view/helper/ui_helper.dart';
import 'package:iskaan_inspections_mobile/view/widgets/app_bar/appbar_widget.dart';
import 'package:iskaan_inspections_mobile/view/widgets/button/custom_button.dart';
import 'package:iskaan_inspections_mobile/view/widgets/dropdown/dropdown_widget.dart';
import 'package:iskaan_inspections_mobile/view/widgets/textfield/text_field_widget.dart';

class AddSnagScreen extends StatelessWidget {
   AddSnagScreen({super.key});
  final GlobalKey<FormState> _formKey =GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWidget(
        title: 'Add Snag',
        isNotificationEnabled: false,
      ),
      body: Container(
        margin: const EdgeInsets.all(16.0),
        padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 14.0),
        decoration: BoxDecoration(
            color: AppColors.white, borderRadius: BorderRadius.circular(10.0)),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                DropdownWidget<String>(
                  label: 'Community *',
                  hint: 'Select Community',
                  selectedItem: null,
                  items: const ['Hello', 'To', 'The', 'Future'],
                  onChanged: (value) {},
                  validator: (value){
                    if(value?.isEmpty??true){
                      return 'required';
                    }
                    return null;
                  },
                ),
                TextFieldWidget(
                  label: 'Description *',
                  hint: 'Add a description',
                  validator: (value) {
                    if (value?.isEmpty ?? true) {
                      return 'required';
                    }
                    return null;
                  },
                ),
                UIHelper.verticalSpace(10.0),
                DropdownWidget<String>(
                  label: 'Risk *',
                  hint: 'Select Risk',
                  selectedItem: null,
                  items: const ['High', 'Low', 'Medium',],
                  onChanged: (value) {},
                  validator: (value){
                    if(value?.isEmpty??true){
                      return 'required';
                    }
                    return null;
                  },
                ),
                UIHelper.verticalSpace(10.0),
                TextFieldWidget(
                  label: 'Location *',
                  hint: 'Write the location of the snag',
                  validator: (value) {
                    if (value?.isEmpty ?? true) {
                      return 'required';
                    }
                    return null;
                  },
                ),
                UIHelper.verticalSpace(10.0),
                const TextFieldWidget(
                  label: 'Additional Notes',
                  hint: 'Give additional notes for the snag',
                ),
                UIHelper.verticalSpace(10.0),
                const Text(
                  'Upload Images',
                  style: AppTextStyles.style16LightGrey400,
                ),
                UIHelper.verticalSpace(8.0),
                CustomButton(
                  text: 'Add Images',
                  invert: true,
                  icon: const Icon(
                    Icons.photo_outlined,
                    color: AppColors.primary,
                  ),
                  onPressed: () {},
                ),
                UIHelper.verticalSpace(2.0),
                const Text(
                  '• Maximum image size should be 2MB',
                  style: AppTextStyles.style10LightGrey400,
                ),
                UIHelper.verticalSpace(20.0),
                CustomButton(
                  text: 'Submit',
                  onPressed: () {
                    if(_formKey.currentState!.validate()){

                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
