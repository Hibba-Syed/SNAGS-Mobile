import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iskaan_inspections_mobile/bloc/Login/login_cubit.dart';
import 'package:iskaan_inspections_mobile/res/constants/app_colors.dart';
import 'package:iskaan_inspections_mobile/res/constants/images.dart';
import 'package:iskaan_inspections_mobile/res/enums.dart';
import 'package:iskaan_inspections_mobile/res/styles/styles.dart';
import 'package:iskaan_inspections_mobile/utils/routes/app_routes.dart';
import 'package:iskaan_inspections_mobile/utils/validation_util.dart';
import 'package:iskaan_inspections_mobile/view/helper/ui_helper.dart';
import 'package:iskaan_inspections_mobile/view/widgets/button/custom_button.dart';
import 'package:iskaan_inspections_mobile/view/widgets/custom_loader.dart';
import 'package:iskaan_inspections_mobile/view/widgets/textfield/password_text_field.dart';
import 'package:iskaan_inspections_mobile/view/widgets/textfield/text_field_widget.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        backgroundColor: AppColors.white,
        body: SafeArea(
          child: Stack(
            children: [
              _loginBackgroundImage(),
              _loginUi(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _loginBackgroundImage() {
    return Image.asset(
      AppImages.background,
      width: double.infinity,
      height: double.infinity,
      fit: BoxFit.cover,
    );
  }

  Widget _loginUi(
    BuildContext context,
  ) {
    return Center(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: BlocBuilder<LoginCubit, LoginState>(
            builder: (context, state) {
              return Form(
                key: _formKey,
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                      maxWidth: MediaQuery.of(context).size.width),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        AppImages.appLogo,
                        width: MediaQuery.of(context).size.height * 0.15,
                      ),
                      UIHelper.verticalSpace(20.0),
                      const Text(
                        'Inspections Login',
                        style: AppTextStyles.style20Primary600,
                      ),
                      UIHelper.verticalSpace(20.0),
                      TextFieldWidget(
                        label: 'Email',
                        hint: 'Enter your email',
                        validator: (value) {
                          if (value?.isEmpty ?? true) {
                            return "Field is mandatory";
                          }
                          if (!ValidationUtil.isEmailValid(value)) {
                            return 'Enter a valid email';
                          }
                          return null;
                        },
                        prefix: const Icon(
                          Icons.email_outlined,
                          color: AppColors.primary,
                        ),
                      ),
                      UIHelper.verticalSpace(10.0),
                      PasswordTextField(
                        label: 'Password',
                        hint: 'Enter your password',
                        validator: (value) {
                          if (value?.isEmpty ?? true) {
                            return 'Field is mandatory';
                          }
                          return null;
                        },
                      ),
                      UIHelper.verticalSpace(10.0),
                      Align(
                        alignment: Alignment.centerRight,
                        child: InkWell(
                          onTap: () {
                            Navigator.pushNamed(
                                context, AppRoutes.forgotPassword);
                          },
                          child: const Text(
                            "Forgot password?",
                            style: AppTextStyles.style16Primary400,
                          ),
                        ),
                      ),
                      UIHelper.verticalSpace(10.0),
                      Builder(
                        builder: (context) {
                          if (state.loadingState == LoadingState.loading) {
                            return const SizedBox(
                              height: 50,
                              child: CustomLoader(),
                            );
                          }
                          return CustomButton(
                            text: "Login",
                            onPressed: () async{
                              Navigator.pushNamed(context, AppRoutes.mainDashboard);
                              if (state.loadingState == LoadingState.loading) {
                                return;
                              }
                              if (_formKey.currentState?.validate() ?? false) {
                                // loginCubit.loginUser(context);
                              }
                            },
                          );
                        },
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
