import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iskaan_inspections_mobile/res/enums.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(const LoginState());

  // void onChangeLoginModel(LoginModel? loginModel) {
  //   emit(state.copyWith(loginModel: loginModel));
  // }

  void onChangeEmail(String? email) {
    emit(state.copyWith(email: email));
  }

  void onChangeObscure(bool? obscure) {
    emit(state.copyWith(obscure: obscure));
  }

  void onChangePassword(String? password) {
    emit(state.copyWith(password: password));
  }

  Future<void> loginUser({bool newUser = false}) async {
    emit(state.copyWith(loadingState: LoadingState.loading));
    // await AuthenticationService.loginUser(
    //   state.email,
    //   state.password,
    // ).then((value) {
    //   if (value is Success) {
    //     emit(state.copyWith(
    //       loginModel: loginModelFromJson(value.response as String)[0],
    //     ));
    //     List<LoginModel> loginModelList =
    //         loginModelFromJson(value.response as String);
    //     String? deviceLoginModelList =
    //         Global.storageService.getAuthenticationModelString();
    //     if (deviceLoginModelList != null) {
    //       List<LoginModel> convertedDeviceLoginModelList =
    //           loginModelFromJson(deviceLoginModelList);
    //       loginModelList.removeWhere((element) {
    //         for (LoginModel convertedDeviceLoginModel
    //             in convertedDeviceLoginModelList) {
    //           if (element.owner?.id == convertedDeviceLoginModel.owner?.id &&
    //               element.owner?.email ==
    //                   convertedDeviceLoginModel.owner?.email &&
    //               element.owner?.companyId ==
    //                   convertedDeviceLoginModel.owner?.companyId) {
    //             return true;
    //           }
    //         }
    //         return false;
    //       });
    //     }
    //
    //     if (loginModelList.isEmpty) {
    //       emit(state.copyWith(loadingState: LoadingState.error));
    //       return Fluttertoast.showToast(
    //           msg: "You are already logged in with this account");
    //     }
    //     if (loginModelFromJson(value.response as String).length == 1) {
    //       Global.storageService.setAuthenticationModelString(loginModelList[0],
    //           newUser: newUser);
    //       return context
    //           .read<ProfileCubit>()
    //           .getProfile(context)
    //           .then((isLoaded) {
    //         if (isLoaded) {
    //           emit(state.copyWith(
    //             loginModel: loginModelList[0],
    //             loadingState: LoadingState.success,
    //           ));
    //           if (!newUser) {
    //             Global.storageService
    //                 .setLoginCreds([state.email, state.password]);
    //           }
    //           context.read<AppThemeCubit>().onChangeAppTheme(const ProfilePage()
    //               .parseHexColor(state.loginModel?.owner?.company?.themeColor ??
    //                   "#751b50"));
    //           LoginPage().initialCalls(context);
    //           return Navigator.pushReplacementNamed(
    //               context, AppRoutes.dashboard);
    //         } else {
    //           Fluttertoast.showToast(msg: "Unable to load profile");
    //           emit(state.copyWith(loadingState: LoadingState.error));
    //         }
    //       });
    //     } else {
    //       if (!newUser) {
    //         Global.storageService.setLoginCreds([state.email, state.password]);
    //       }
    //       emit(state.copyWith(
    //         loginModel: loginModelList[0],
    //         loadingState: LoadingState.success,
    //       ));
    //       return Navigator.pushNamed(context, AppRoutes.companies,
    //           arguments: [loginModelList, newUser]);
    //     }
    //   }
    //   value as Failure;
    //   Fluttertoast.showToast(
    //       msg: value.errorResponse as String? ?? "Unable to login");
    //   emit(state.copyWith(loadingState: LoadingState.error));
    // });
  }
}
