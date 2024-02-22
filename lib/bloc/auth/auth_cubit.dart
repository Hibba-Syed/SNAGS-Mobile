import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:iskaan_inspections_mobile/bloc/profile/profile_cubit.dart';
import 'package:iskaan_inspections_mobile/repo/auth/atuh_repo_impl.dart';
import 'package:iskaan_inspections_mobile/repo/auth/auth_repo.dart';
import 'package:iskaan_inspections_mobile/utils/preference_utils.dart';
import 'package:iskaan_inspections_mobile/utils/routes/app_routes.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(const AuthState());

  final AuthRepo _authRepo = AuthRepoImpl();

  Future<void> login(
    BuildContext context, {
    required String email,
    required String password,
  }) async {
    emit(state.copyWith(isLoading: true));
    await _authRepo.login(
      {
        'email': email,
        'password': password,
      },
    ).onError(
      (error, stackTrace) {
        emit(state.copyWith(isLoading: false));
        Fluttertoast.showToast(
          msg: error.toString(),
        );
        throw error!;
      },
    ).then(
      (loginResponse) {
        emit(state.copyWith(isLoading: false));
        if (loginResponse != null) {
          spUtil.token = loginResponse.accessToken;
          context.read<ProfileCubit>().getProfile();
          Navigator.of(context).pushNamedAndRemoveUntil(
              AppRoutes.mainDashboard, (route) => false);
        } else {
          Fluttertoast.showToast(
              msg: 'Something went wrong, please try again later');
        }
      },
    );
  }
}
