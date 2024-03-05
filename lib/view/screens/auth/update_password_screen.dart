import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iskaan_inspections_mobile/bloc/auth/auth_cubit.dart';
import 'package:iskaan_inspections_mobile/res/constants/app_colors.dart';
import 'package:iskaan_inspections_mobile/res/styles/styles.dart';
import 'package:iskaan_inspections_mobile/utils/validation_util.dart';
import 'package:iskaan_inspections_mobile/view/helper/ui_helper.dart';
import 'package:iskaan_inspections_mobile/view/widgets/app_bar/appbar_widget.dart';
import 'package:iskaan_inspections_mobile/view/widgets/button/custom_button.dart';
import 'package:iskaan_inspections_mobile/view/widgets/custom_loader.dart';
import 'package:iskaan_inspections_mobile/view/widgets/textfield/password_text_field.dart';

class UpdatePasswordScreen extends StatefulWidget {
  const UpdatePasswordScreen({super.key});

  @override
  State<UpdatePasswordScreen> createState() => _UpdatePasswordScreenState();
}

class _UpdatePasswordScreenState extends State<UpdatePasswordScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _currentPasswordController =
      TextEditingController();

  final TextEditingController _newPasswordController = TextEditingController();

  final TextEditingController _confirmPasswordController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWidget(
        title: 'Change Password',
        isNotificationEnabled: false,
      ),
      body: Stack(
        children: [
          Container(
            margin: const EdgeInsets.all(16.0),
            padding:
                const EdgeInsets.symmetric(horizontal: 12.0, vertical: 14.0),
            decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(10.0)),
            child: Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          const Text(
                            'Update Password',
                            style: AppTextStyles.style16Grey600,
                          ),
                          UIHelper.verticalSpace(10.0),
                          PasswordTextField(
                            controller: _currentPasswordController,
                            label: 'Current Password *',
                            validator: (value) {
                              if (value?.isEmpty ?? true) {
                                return 'required';
                              }
                              return null;
                            },
                          ),
                          UIHelper.verticalSpace(10.0),
                          PasswordTextField(
                            controller: _newPasswordController,
                            label: 'New Password *',
                            validator: (value) {
                              return ValidationUtil().validatePassword(value!);
                            },
                          ),
                          UIHelper.verticalSpace(10.0),
                          PasswordTextField(
                            controller: _confirmPasswordController,
                            label: 'Confirm Password *',
                            validator: (value) {
                              if (value?.isEmpty ?? true) {
                                return 'required';
                              }
                              if (value != _newPasswordController.text) {
                                return "Password doesn't match";
                              }
                              return null;
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                CustomButton(
                  text: 'Submit',
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      context.read<AuthCubit>().updatePassword(
                        context,
                        currentPassword:
                        _currentPasswordController.text,
                        newPassword: _newPasswordController.text,
                        confirmPassword:
                        _confirmPasswordController.text,
                      );
                    }
                  },
                ),
              ],
            ),
          ),
          BlocBuilder<AuthCubit, AuthState>(
            builder: (context, state) {
              return Visibility(
                visible: state.isLoading,
                child: const CustomLoader(),
              );
            },
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _currentPasswordController.dispose();

    _newPasswordController.dispose();

    _confirmPasswordController.dispose();
  }
}
