import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iskaan_inspections_mobile/bloc/activities/activities_cubit.dart';
import 'package:iskaan_inspections_mobile/model/user_activity/user_activity_response_model.dart';
import 'package:iskaan_inspections_mobile/res/constants/app_colors.dart';
import 'package:iskaan_inspections_mobile/view/helper/ui_helper.dart';
import 'package:iskaan_inspections_mobile/view/widgets/app_bar/appbar_widget.dart';
import 'package:iskaan_inspections_mobile/view/widgets/custom_loader.dart';
import 'package:iskaan_inspections_mobile/view/widgets/empty_widget.dart';
import 'package:iskaan_inspections_mobile/view/widgets/log_widget.dart';

class ActivitiesScreen extends StatelessWidget {
  const ActivitiesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWidget(
        title: 'Activities',
      ),
      body: Container(
        margin: const EdgeInsets.all(16.0),
        padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 14.0),
        decoration: BoxDecoration(
            color: AppColors.white, borderRadius: BorderRadius.circular(10.0)),
        child: BlocBuilder<ActivitiesCubit, ActivitiesState>(
          builder: (context, state) {
            if(state.isLoading==true){
              return const CustomLoader();
            }
            if(state.userActivities?.isEmpty??true){
              return const EmptyWidget(
                text: 'No activities found',
              );
            }
            return RefreshIndicator(
              onRefresh: ()async{
                context.read<ActivitiesCubit>().getActivities();
              },
              child: ListView.separated(
                itemCount: state.userActivities?.length??0,
                physics: const AlwaysScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  UserActivityModel? item = state.userActivities?[index];
                  return  LogWidget(
                    description: item?.description??'--',
                    loggerName: item?.logger?.name??'--',
                    date: item?.createdAt,
                    loggerImageUrl: item?.logger?.profilePicture,
                  );
                },
                separatorBuilder: (context, index) {
                  return UIHelper.verticalSpace(10.0);
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
