import 'package:flutter/material.dart';
import 'package:iskaan_inspections_mobile/view/helper/ui_helper.dart';
class StatusWidget extends StatelessWidget {
  final String status;
  final Color color;
  const StatusWidget({super.key,required this.status,required this.color,});

  @override
  Widget build(BuildContext context) {
    return  Container(
      padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 4.0),
      decoration: BoxDecoration(
        color: color.withOpacity(0.13),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.circle,color: color,size: 10,),
          UIHelper.horizontalSpace(3.0),
          Text(
            status,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: color,
            ),
          ),
        ],
      ),
    );
  }
}
