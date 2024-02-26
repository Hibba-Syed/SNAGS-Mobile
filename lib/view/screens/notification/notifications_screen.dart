import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iskaan_inspections_mobile/bloc/notification/notifications_cubit.dart';
import 'package:iskaan_inspections_mobile/view/widgets/app_bar/appbar_widget.dart';
import 'package:iskaan_inspections_mobile/view/widgets/empty_widget.dart';
import 'package:iskaan_inspections_mobile/view/widgets/notification_widget.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWidget(
        title: 'Notifications',
        isNotificationEnabled: false,
      ),
      body: BlocBuilder<NotificationsCubit, NotificationsState>(
        builder: (context, state) {
          // if (state.isLoading == true) {
          //   return const CustomLoader();
          // }
          return Expanded(
            child: RefreshIndicator(
              onRefresh: () async {
                // context.read<NotificationsCubit>().getNotifications(context);
              },
              child: ListView.builder(
                itemCount: 10,
                physics: const AlwaysScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (BuildContext context, int index) {
                  return NotificationWidget(
                    title: 'Hello',
                    message: 'Future is here',
                    onTap: () {},
                  );
                },
              ),
              // : const EmptyWidget(text: 'No Notifications found',)
            ),
          );
        },
      ),
    );
  }
}
