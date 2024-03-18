import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iskaan_inspections_mobile/bloc/dashboard/dashboard_cubit.dart';
import 'package:iskaan_inspections_mobile/bloc/main_dashboard/main_dashboard_cubit.dart';
import 'package:iskaan_inspections_mobile/res/constants/app_colors.dart';
import 'package:iskaan_inspections_mobile/res/constants/constants.dart';
import 'package:iskaan_inspections_mobile/res/constants/images.dart';
import 'package:iskaan_inspections_mobile/res/constants/strings.dart';
import 'package:iskaan_inspections_mobile/res/styles/styles.dart';
import 'package:iskaan_inspections_mobile/utils/preference_utils.dart';
import 'package:iskaan_inspections_mobile/view/helper/ui_helper.dart';
import 'package:iskaan_inspections_mobile/view/screens/communities/communities_screen.dart';
import 'package:iskaan_inspections_mobile/view/screens/dashboard/components/drawer_item_model.dart';
import 'package:iskaan_inspections_mobile/view/screens/dashboard/dashboard_screen.dart';
import 'package:iskaan_inspections_mobile/view/screens/inspection/inspections_screen.dart';
import 'package:iskaan_inspections_mobile/view/screens/profile/profile_screen.dart';
import 'package:iskaan_inspections_mobile/view/screens/snags/snags_screen.dart';
import 'package:iskaan_inspections_mobile/view/widgets/app_bar/appbar_widget.dart';
import 'package:iskaan_inspections_mobile/view/widgets/drawer/drawer_list_tile.dart';

import '../../../utils/routes/app_routes.dart';

class MainDashboardScreen extends StatelessWidget {
  MainDashboardScreen({super.key});

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  final List<DrawerItemModel> _drawerItems = [
    DrawerItemModel(
      index: AppConstants.menuIndex,
      title: 'MENU',
      iconPath: '',
      onTap: () {},
    ),
    DrawerItemModel(
      index: AppConstants.dashboardIndex,
      title: 'Dashboard',
      iconPath: AppImages.icDashboard,
      onTap: () {},
    ),
    DrawerItemModel(
      index: AppConstants.communitiesIndex,
      title: 'Communities',
      iconPath: AppImages.icCommunities,
      onTap: () {},
    ),
    DrawerItemModel(
      index: AppConstants.inspectionIndex,
      title: 'Inspections',
      iconPath: AppImages.icInspection,
      onTap: () {},
    ),
    DrawerItemModel(
      index: AppConstants.snagsIndex,
      title: 'Snags',
      iconPath: AppImages.icSnags,
      onTap: () {},
    ),
    DrawerItemModel(
      index: AppConstants.generalIndex,
      title: 'GENERAL',
      iconPath: '',
      onTap: () {},
    ),
    DrawerItemModel(
      index: AppConstants.profileIndex,
      title: 'Profile',
      iconPath: AppImages.icProfile,
      onTap: () {},
    ),
    DrawerItemModel(
      index: AppConstants.logoutIndex,
      title: 'Logout',
      iconPath: AppImages.icLogout,
      onTap: () async {},
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainDashboardCubit, MainDashboardState>(
      builder: (context, state) {
        return GestureDetector(
          onTap: () {
            context
                .read<DashboardCubit>()
                .onChangeIsFloatingButtonExpanded(false);
          },
          child: Scaffold(
            key: _scaffoldKey,
            appBar: AppBarWidget(
              leading: IconButton(
                onPressed: () {
                  _scaffoldKey.currentState?.openDrawer();
                  context
                      .read<DashboardCubit>()
                      .onChangeIsFloatingButtonExpanded(false);
                },
                icon: const Icon(
                  Icons.menu,
                  color: AppColors.lightGrey,
                ),
              ),
              title: _getTitle(state),
            ),
            drawer: Drawer(
              backgroundColor: AppColors.white,
              child: ListView(
                children: [
                  DrawerHeader(
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.fill,
                        image: AssetImage(
                          AppImages.drawerHeaderBackground,
                        ),
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset(
                          AppImages.appLogo,
                          width: 200,
                          height: 80,
                        ),
                        UIHelper.verticalSpace(10.0),
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8.0, vertical: 4.0),
                          decoration: BoxDecoration(
                            color: AppColors.primary,
                            borderRadius: BorderRadius.circular(6.0),
                          ),
                          child: const Text(
                            'INSPECTIONS',
                            style: AppTextStyles.style10White400,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20.0,
                      vertical: 16.0,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ListView.builder(
                          itemCount: (_drawerItems.length),
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            DrawerItemModel item = _drawerItems[index];
                            if (index == AppConstants.menuIndex ||
                                index == AppConstants.generalIndex) {
                              return Text(
                                item.title,
                                style: AppTextStyles.style14LightGrey400,
                              );
                            }
                            return DrawerListTile(
                                title: item.title,
                                iconPath: item.iconPath,
                                onTap: () {
                                  if (item.index == AppConstants.logoutIndex) {
                                    spUtil.remove(Strings.keyToken);
                                    spUtil.remove(Strings.keyProfile);
                                    Navigator.pushNamedAndRemoveUntil(context,
                                        AppRoutes.login, (route) => false);
                                    return;
                                  }
                                  context
                                      .read<MainDashboardCubit>()
                                      .onChangeSelectedIndex(context,item.index);
                                  Navigator.of(context).pop();
                                },
                                isSelected: item.index == state.selectedIndex);
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            body: _getScreen(state),
          ),
        );
      },
    );
  }

  String _getTitle(MainDashboardState state) {
    if (state.selectedIndex == AppConstants.dashboardIndex) {
      return 'Dashboard';
    } else if (state.selectedIndex == AppConstants.communitiesIndex) {
      return 'Communities';
    } else if (state.selectedIndex == AppConstants.inspectionIndex) {
      return 'Inspection';
    } else if (state.selectedIndex == AppConstants.snagsIndex) {
      return 'Snags';
    } else if (state.selectedIndex == AppConstants.profileIndex) {
      return 'Profile';
    }
    return '';
  }

  Widget _getScreen(MainDashboardState state) {
    if (state.selectedIndex == AppConstants.dashboardIndex) {
      return  DashboardScreen();
    } else if (state.selectedIndex == AppConstants.communitiesIndex) {
      return const CommunitiesScreen();
    } else if (state.selectedIndex == AppConstants.inspectionIndex) {
      return const InspectionsScreen();
    } else if (state.selectedIndex == AppConstants.snagsIndex) {
      return const SnagsScreen();
    } else if (state.selectedIndex == AppConstants.profileIndex) {
      return const ProfileScreen();
    }
    return const SizedBox.shrink();
  }
}
