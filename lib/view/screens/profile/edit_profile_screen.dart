import 'package:flutter/material.dart';
import 'package:iskaan_inspections_mobile/res/constants/app_colors.dart';
import 'package:iskaan_inspections_mobile/res/globals.dart';
import 'package:iskaan_inspections_mobile/res/styles/styles.dart';
import 'package:iskaan_inspections_mobile/view/helper/ui_helper.dart';
import 'package:iskaan_inspections_mobile/view/widgets/app_bar/appbar_widget.dart';
import 'package:iskaan_inspections_mobile/view/widgets/button/custom_button.dart';
import 'package:iskaan_inspections_mobile/view/widgets/textfield/text_field_widget.dart';

class EditProfileScreen extends StatelessWidget {
  EditProfileScreen({super.key});

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWidget(
        title: 'Edit Profile',
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
              children: [
                const Text(
                  'Update User Info',
                  style: AppTextStyles.style16Grey600,
                ),
                UIHelper.verticalSpace(10.0),
                TextFieldWidget(
                  initialValue: Globals().profileRecord?.firstName,
                  controller: _firstNameController,
                  label: 'First Name *',
                  hint: 'Enter first name',
                  validator: (value) {
                    if (value?.isEmpty ?? true) {
                      return 'required';
                    }
                    return null;
                  },
                ),
                UIHelper.verticalSpace(10.0),
                TextFieldWidget(
                  initialValue: Globals().profileRecord?.lastName,
                  controller: _lastNameController,
                  label: 'Last Name *',
                  hint: 'Enter last name',
                  validator: (value) {
                    if (value?.isEmpty ?? true) {
                      return 'required';
                    }
                    return null;
                  },
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
