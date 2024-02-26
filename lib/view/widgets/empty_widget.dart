import 'package:flutter/material.dart';
import 'package:iskaan_inspections_mobile/res/styles/styles.dart';

class EmptyWidget extends StatelessWidget {
  final String? text;
  const EmptyWidget({
    super.key,
    this.text,
  });

  @override
  Widget build(BuildContext context) {
    return  Center(
      child: Text(
        text??'No data found',
        style: AppTextStyles.style14Grey400,
      ),
    );
  }
}
