import 'package:flutter/material.dart';
import 'package:iskaan_inspections_mobile/model/permission_model.dart';
import 'package:iskaan_inspections_mobile/res/constants/app_colors.dart';
import 'package:iskaan_inspections_mobile/res/globals.dart';
import 'package:iskaan_inspections_mobile/view/helper/ui_helper.dart';
import 'package:iskaan_inspections_mobile/view/screens/profile/components/permission_widget.dart';
import 'package:iskaan_inspections_mobile/view/widgets/app_bar/appbar_widget.dart';
import 'package:iskaan_inspections_mobile/view/widgets/empty_widget.dart';

class PermissionsScreen extends StatelessWidget {
  const PermissionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWidget(
        title: 'Permissions',
      ),
      body: Container(
        margin: const EdgeInsets.all(16.0),
        padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 14.0),
        decoration: BoxDecoration(
            color: AppColors.white, borderRadius: BorderRadius.circular(10.0)),
        child: Expanded(
          child:(Globals().profileRecord?.roles?.isNotEmpty??false)?
              (Globals().profileRecord?.roles?.first.permissions?.isNotEmpty ??
                      false)
                  ? ListView.separated(
                      itemCount: Globals()
                              .profileRecord
                              ?.roles
                              ?.first
                              .permissions
                              ?.length ??
                          0,
                      itemBuilder: (context, index) {
                        Permission? item = Globals()
                            .profileRecord
                            ?.roles
                            ?.first
                            .permissions?[index];
                        return  PermissionWidget(
                          title: item?.title??'',
                          info: item?.description??'--',
                        );
                      },
                      separatorBuilder: (context, index) {
                        return UIHelper.verticalSpace(10.0);
                      },
                    )
                  : const EmptyWidget(
                      text: 'No permissions found',
                    ): const EmptyWidget(
            text: 'No roles',
          ),
        ),
      ),
    );
  }
}
