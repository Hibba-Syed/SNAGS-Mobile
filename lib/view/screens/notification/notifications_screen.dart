import 'package:flutter/material.dart';
import 'package:iskaan_inspections_mobile/view/widgets/app_bar/appbar_widget.dart';
class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: const AppBarWidget(
        title: 'Notifications',
        isNotificationEnabled: false,
      ),
      body: Container(),
    );
  }
}
