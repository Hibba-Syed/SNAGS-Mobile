import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iskaan_inspections_mobile/bloc/send_otp/send_otp_cubit.dart';
import 'package:iskaan_inspections_mobile/res/constants/app_colors.dart';
import 'package:iskaan_inspections_mobile/res/constants/images.dart';
import 'package:iskaan_inspections_mobile/res/enums.dart';
import 'package:iskaan_inspections_mobile/res/styles/styles.dart';
import 'package:iskaan_inspections_mobile/utils/validation_util.dart';
import 'package:iskaan_inspections_mobile/view/helper/ui_helper.dart';
import 'package:iskaan_inspections_mobile/view/widgets/app_bar/appbar_widget.dart';
import 'package:iskaan_inspections_mobile/view/widgets/button/custom_button.dart';
import 'package:iskaan_inspections_mobile/view/widgets/custom_loader.dart';
import 'package:iskaan_inspections_mobile/view/widgets/textfield/text_field_widget.dart';
import 'package:lottie/lottie.dart';

class ForgotPasswordPage extends StatelessWidget {
  ForgotPasswordPage({super.key});
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(

        appBar: const AppBarWidget(
          title: 'Forgot Password',
          isNotificationEnabled: false,
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Expanded(
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                      maxWidth: MediaQuery.of(context).size.width,
                      minWidth: 0,
                    ),
                    child: Center(
                      child: SingleChildScrollView(
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Form(
                            key: _formKey,
                            child: BlocBuilder<SendOtpCubit, SendOtpState>(
                              builder: (context, state) {
                                return Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    LottieBuilder.asset(
                                      AppImages.forgotJson,
                                      repeat: false,
                                      width: 200,
                                    ),
                                    UIHelper.verticalSpace(10.0),
                                    const Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        "Enter your email address to receive instructions on how to reset your password.",
                                        style: AppTextStyles.style16DarkGrey400,
                                        textAlign: TextAlign.left,
                                      ),
                                    ),
                                    UIHelper.verticalSpace(10.0),
                                    TextFieldWidget(
                                      label: 'Email',
                                      hint: 'Enter your email',
                                      validator: (value) {
                                        if (value?.isEmpty ?? true) {
                                          return "Field is mandatory";
                                        }
                                        if (!ValidationUtil.isEmailValid(
                                            value)) {
                                          return 'Enter a valid email';
                                        }
                                        return null;
                                      },
                                      prefix: const Icon(
                                        Icons.email_outlined,
                                        color: AppColors.primary,
                                      ),
                                    ),
                                    UIHelper.verticalSpace(20.0),
                                    Builder(
                                      builder: (context) {
                                        if (state.loadingState ==
                                            LoadingState.loading) {
                                          return const SizedBox(
                                              height: 50,
                                              child: CustomLoader());
                                        }
                                        return CustomButton(
                                            text: "Send",
                                            onPressed: () {
                                              if (_formKey.currentState
                                                      ?.validate() ??
                                                  false) {
                                                // context
                                                //     .read<SendOtpCubit>()
                                                //     .sendOTP(context);
                                              }
                                            });
                                      },
                                    ),
                                    UIHelper.verticalSpace(20.0),
                                  ],
                                );
                              },
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
