import 'package:flutter/material.dart';
import 'package:iskaan_inspections_mobile/res/constants/app_colors.dart';

class NIButton extends StatefulWidget {
  final void Function(bool) onValueChanged;
  const NIButton({
    super.key,
    required this.onValueChanged,
  });

  @override
  State<NIButton> createState() => _NIButtonState();
}

class _NIButtonState extends State<NIButton> {
  bool _isClicked = false;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          _isClicked = !_isClicked;
        });
        widget.onValueChanged(_isClicked);
      },
      child: Container(
        margin: const EdgeInsets.only(left: 8.0),
        padding: const EdgeInsets.symmetric(horizontal: 6.0, vertical: 4.0),
        decoration: BoxDecoration(
            color: _isClicked ? AppColors.red : AppColors.white,
            borderRadius: BorderRadius.circular(2.0),
            border: Border.all(color: AppColors.red)),
        child: Text(
          'NI',
          style: TextStyle(
            color: _isClicked ? AppColors.white : AppColors.red,
            fontSize: 10.0,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    );
  }
}
