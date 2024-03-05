import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iskaan_inspections_mobile/bloc/auth/auth_cubit.dart';
import 'package:iskaan_inspections_mobile/bloc/communities/communities_cubit.dart';
import 'package:iskaan_inspections_mobile/bloc/communities/detail/community_detail_inspections/community_detail_inspections_cubit.dart';
import 'package:iskaan_inspections_mobile/bloc/communities/detail/community_detail_snags/community_detail_snags_cubit.dart';
import 'package:iskaan_inspections_mobile/bloc/communities/detail/community_details_statistics/community_detail_statistics_cubit.dart';
import 'package:iskaan_inspections_mobile/bloc/community_detail/community_detail_cubit.dart';
import 'package:iskaan_inspections_mobile/bloc/dashboard/dashboard_cubit.dart';
import 'package:iskaan_inspections_mobile/bloc/inspection/add_edit/add_edit_inspection_cubit.dart';
import 'package:iskaan_inspections_mobile/bloc/inspection/detail/inspection_details_cubit.dart';
import 'package:iskaan_inspections_mobile/bloc/inspection/inspection_cubit.dart';
import 'package:iskaan_inspections_mobile/bloc/main_dashboard/main_dashboard_cubit.dart';
import 'package:iskaan_inspections_mobile/bloc/notification/notifications_cubit.dart';
import 'package:iskaan_inspections_mobile/bloc/profile/profile_cubit.dart';
import 'package:iskaan_inspections_mobile/bloc/send_otp/send_otp_cubit.dart';
import 'package:iskaan_inspections_mobile/bloc/snags/add_edit_snag/add_edit_snag_cubit.dart';
import 'package:iskaan_inspections_mobile/bloc/snags/snag_detail/snag_detail_cubit.dart';
import 'package:iskaan_inspections_mobile/bloc/snags/snags_cubit.dart';
import 'package:iskaan_inspections_mobile/utils/routes/app_routes.dart';
import 'package:iskaan_inspections_mobile/view/screens/auth/forgot_password.dart';
import 'package:iskaan_inspections_mobile/view/screens/auth/login_screen.dart';
import 'package:iskaan_inspections_mobile/view/screens/auth/update_password_screen.dart';
import 'package:iskaan_inspections_mobile/view/screens/communities/detail/community_detail_screen.dart';
import 'package:iskaan_inspections_mobile/view/screens/dashboard/main_dashboard_screen.dart';
import 'package:iskaan_inspections_mobile/view/screens/inspection/add_inspection_screen.dart';
import 'package:iskaan_inspections_mobile/view/screens/inspection/detail/inspection_detail_screen.dart';
import 'package:iskaan_inspections_mobile/view/screens/inspection/edit_inspection/edit_inspection_screen.dart';
import 'package:iskaan_inspections_mobile/view/screens/notification/notifications_screen.dart';
import 'package:iskaan_inspections_mobile/view/screens/profile/edit_profile_screen.dart';
import 'package:iskaan_inspections_mobile/view/screens/snags/add_snag_screen.dart';
import 'package:iskaan_inspections_mobile/view/screens/snags/edit_snag_screen.dart';
import 'package:iskaan_inspections_mobile/view/screens/snags/snag_detail_screen.dart';
import 'package:iskaan_inspections_mobile/view/screens/splash_screen.dart';

class AppPages {
  static List<PageEntity> routes = [
    PageEntity(
      route: AppRoutes.splash,
      page: const SplashScreen(),
      // bloc: BlocProvider(
      //   create: (context) => AppThemeCubit(),
      // ),
    ),
    // PageEntity(
    //   route: AppRoutes.authorization,
    //   page: const AuthenticationPage(),
    //   bloc: BlocProvider(
    //     create: (context) => AuthenticationCubit(),
    //   ),
    // ),
    PageEntity(
      route: AppRoutes.login,
      page: LoginScreen(),
      bloc: BlocProvider(
        create: (context) => AuthCubit(),
      ),
    ),
    // PageEntity(
    //   route: AppRoutes.otpVerification,
    //   page: const OtpVerificationScreen(),
    //   bloc: BlocProvider(
    //     create: (context) => VerifyOtpCubit(),
    //   ),
    // ),
    PageEntity(
      route: AppRoutes.forgotPassword,
      page: ForgotPasswordPage(),
      bloc: BlocProvider(
        create: (context) => SendOtpCubit(),
      ),
    ),
    PageEntity(
      route: AppRoutes.mainDashboard,
      page: MainDashboardScreen(),
      bloc: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => MainDashboardCubit(),
          ),
          BlocProvider(
            create: (context) => DashboardCubit(),
          ),
          BlocProvider(
            create: (context) => CommunitiesCubit(),
          ),
          BlocProvider(
            create: (context) => InspectionCubit(),
          ),
          BlocProvider(
            create: (context) => SnagsCubit(),
          ),
          BlocProvider(
            create: (context) => ProfileCubit(),
          ),
        ],
        child: const SizedBox.shrink(),
      ),
    ),
    PageEntity(
      route: AppRoutes.notifications,
      page: const NotificationsScreen(),
      bloc: BlocProvider(
        create: (context) => NotificationsCubit(),
      ),
    ),
    PageEntity(
      route: AppRoutes.communityDetail,
      page: const CommunityDetailScreen(),
      bloc: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => CommunityDetailCubit(),
          ),
          BlocProvider(
            create: (context) => CommunityDetailStatisticsCubit(),
          ),
          BlocProvider(
            create: (context) => CommunityDetailSnagsCubit(),
          ),
          BlocProvider(
            create: (context) => CommunityDetailInspectionsCubit(),
          ),
        ],
        child: const SizedBox.shrink(),
      ),
    ),
    PageEntity(
      route: AppRoutes.inspectionDetail,
      page: const InspectionDetailScreen(),
      bloc: BlocProvider(
        create: (context) => InspectionDetailsCubit(),
      ),
    ),
    PageEntity(
      route: AppRoutes.addInspection,
      page: const AddInspectionScreen(),
      bloc: BlocProvider(
        create: (context) => AddEditInspectionCubit(),
      ),
    ),
    PageEntity(
      route: AppRoutes.editInspection,
      page: const EditInspectionScreen(),
      bloc: BlocProvider(
        create: (context) => AddEditInspectionCubit(),
      ),
    ),
    PageEntity(
      route: AppRoutes.snagDetail,
      page: const SnagDetailScreen(),
      bloc: BlocProvider(
        create: (context) => SnagDetailCubit(),
      ),
    ),
    PageEntity(
      route: AppRoutes.addSnag,
      page: const AddSnagScreen(),
      bloc: BlocProvider(
        create: (context) => AddEditSnagCubit(),
      ),
    ),
    PageEntity(
      route: AppRoutes.editSnag,
      page: const EditSnagScreen(),
      bloc: BlocProvider(
        create: (context) => AddEditSnagCubit(),
      ),
    ),
    PageEntity(
      route: AppRoutes.editProfile,
      page: EditProfileScreen(),
    ),
    PageEntity(
      route: AppRoutes.updatePassword,
      page: UpdatePasswordScreen(),
    ),
  ];

  static List<dynamic> getAllBlocProviders(BuildContext context) {
    List<dynamic> blocProviders = [];
    for (var element in routes) {
      if (element.bloc != null) {
        blocProviders.add(element.bloc);
      }
    }
    return blocProviders;
  }

  static MaterialPageRoute generateRouteSettings(RouteSettings settings) {
    if (settings.name != null) {
      var result = routes.where((element) => element.route == settings.name);
      if (result.isNotEmpty) {
        return MaterialPageRoute(
            builder: (context) => result.first.page, settings: settings);
      }
    }
    return MaterialPageRoute(
        builder: (context) => const SplashScreen(), settings: settings);
  }
}

class PageEntity {
  final String route;
  final Widget page;
  dynamic bloc;

  PageEntity({required this.route, required this.page, this.bloc});
}
