import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iskaan_inspections_mobile/bloc/dashboard/dashboard_cubit.dart';
import 'package:iskaan_inspections_mobile/res/constants/images.dart';
import 'package:iskaan_inspections_mobile/res/globals.dart';
import 'package:iskaan_inspections_mobile/utils/routes/app_routes.dart';
import 'package:iskaan_inspections_mobile/utils/validation_util.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(4.seconds, () {
      if (ValidationUtil.isValid(Globals().token)) {
        // context.read<ProfileCubit>().getProfile();
        context.read<DashboardCubit>().fetchData();
        Navigator.pushNamedAndRemoveUntil(
            context, AppRoutes.mainDashboard, (route) => false);
      } else {
        Navigator.pushNamedAndRemoveUntil(
            context, AppRoutes.login, (route) => false);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: double.infinity,
            width: double.infinity,
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(AppImages.background),
                  fit: BoxFit.cover,
                  alignment: Alignment.topCenter),
            ),
          ),
          Center(
            child: Image.asset(
              AppImages.appLogo,
              width: MediaQuery.of(context).size.height * 0.15,
            )
                .animate()
                .fade(duration: 2.seconds)
                .slideY(begin: 3, end: 0, duration: 2.seconds),
          ),
        ],
      ),
    );
  }
}
