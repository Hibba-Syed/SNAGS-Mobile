import 'package:flutter/material.dart';
import 'package:iskaan_inspections_mobile/res/constants/app_colors.dart';
import 'package:iskaan_inspections_mobile/res/styles/styles.dart';

class NotificationWidget extends StatelessWidget {
  final String title;
  final String message;
  final VoidCallback onTap;
  const NotificationWidget({
    super.key,
    required this.title,
    required this.message,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border:const Border(
            bottom: BorderSide(
              width: 2.0,
              color: AppColors.primary
            )
          ),
          color: AppColors.white,
          boxShadow: [
            BoxShadow(
              offset: const Offset(1, 1),
              color: Colors.grey.shade300,
              spreadRadius: 1,
              blurRadius: 1,
            )
          ],
        ),
        child: Row(
          children: [
            const Icon(
              Icons.notifications,
              color: AppColors.primary,
            ),
            const SizedBox(
              width: 20,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: AppTextStyles.style16LightGrey400,
                  ),
                  Text(
                    message,
                    style: AppTextStyles.style14LightGrey400,
                    textAlign: TextAlign.left,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
