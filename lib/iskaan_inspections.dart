import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iskaan_inspections_mobile/bloc/dashboard/dashboard_cubit.dart';
import 'package:iskaan_inspections_mobile/res/constants/app_colors.dart';
import 'package:iskaan_inspections_mobile/utils/routes/app_pages.dart';
import 'package:iskaan_inspections_mobile/view/screens/auth/login_screen.dart';

class IskaanInspections extends StatefulWidget {
  const IskaanInspections({super.key});

  @override
  State<IskaanInspections> createState() => _IskaanInspectionsState();
}

class _IskaanInspectionsState extends State<IskaanInspections> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus &&
            currentFocus.focusedChild != null) {
          FocusManager.instance.primaryFocus?.unfocus();
        }
        BlocProvider.of<DashboardCubit>(context)
            .onChangeIsFloatingButtonExpanded(false);
      },
      child: MultiBlocProvider(
        providers: [...AppPages.allBlocProviders(context)],
        child: MaterialApp(
          title: 'Iskaan Inspections',
          theme: ThemeData(
            scaffoldBackgroundColor: AppColors.background,
            colorScheme: ColorScheme.fromSeed(
              seedColor: AppColors.primary,
              background: AppColors.background,
              primary: AppColors.primary,
            ),
            useMaterial3: true,
            fontFamily: 'Inter',
            iconTheme: const IconThemeData(
              color: AppColors.primary,
            ),
          ),
          onGenerateRoute: AppPages.generateRouteSettings,
          home: LoginScreen(),
        ),
      ),
    );
  }
}
