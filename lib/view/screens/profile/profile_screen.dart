import 'package:flutter/material.dart';
import 'package:iskaan_inspections_mobile/model/role_model.dart';
import 'package:iskaan_inspections_mobile/res/constants/app_colors.dart';
import 'package:iskaan_inspections_mobile/res/globals.dart';
import 'package:iskaan_inspections_mobile/res/styles/styles.dart';
import 'package:iskaan_inspections_mobile/utils/routes/app_routes.dart';
import 'package:iskaan_inspections_mobile/view/helper/ui_helper.dart';
import 'package:iskaan_inspections_mobile/view/screens/profile/components/profile_row_button.dart';
import 'package:iskaan_inspections_mobile/view/widgets/image/network_image_widget.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            padding:
                const EdgeInsets.symmetric(horizontal: 10.0, vertical: 8.0),
            decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(10.0)),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.topRight,
                  child: SizedBox(
                    height: 26,
                    child: ListView.builder(
                      itemCount: Globals().profileRecord?.roles?.length??0,
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        RoleModel? item = Globals().profileRecord?.roles?[index];
                        return Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 14.0, vertical: 4.0),
                          decoration: BoxDecoration(
                            color: AppColors.green.withOpacity(0.13),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child:  Text(
                            item?.title??'--',
                            style: const TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: AppColors.green,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
                NetworkImageWidget(
                  url: Globals().profileRecord?.profilePicture,
                  width: 64,
                  height: 64,
                  shape: BoxShape.circle,
                  fit: BoxFit.fill,
                  placeHolder: const Icon(
                    Icons.person,
                    color: AppColors.lightGrey,
                  ),
                ),
                UIHelper.verticalSpace(10.0),
                Text(
                  Globals().profileRecord?.fullName ?? '--',
                  style: AppTextStyles.style16DarkGrey600,
                ),
                UIHelper.verticalSpace(5.0),
                Text(
                  Globals().profileRecord?.email ?? '--',
                  style: AppTextStyles.style14LightGrey400,
                ),
              ],
            ),
          ),
          UIHelper.verticalSpace(16.0),
          Container(
            width: MediaQuery.of(context).size.width,
            padding:
                const EdgeInsets.symmetric(horizontal: 20.0, vertical: 16.0),
            decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(10.0)),
            child: Column(
              children: [
                ProfileRowButton(
                  title: 'Edit Profile',
                  iconData: Icons.person,
                  onTap: () {
                    Navigator.pushNamed(context, AppRoutes.editProfile);
                  },
                ),
                const Divider(
                  color: AppColors.lightGrey,
                  thickness: 0.2,
                ),
                ProfileRowButton(
                  title: 'Update Password',
                  iconData: Icons.lock,
                  onTap: () {
                    Navigator.pushNamed(context, AppRoutes.updatePassword);
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
