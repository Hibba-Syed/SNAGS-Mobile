import 'package:flutter/material.dart';
import 'package:iskaan_inspections_mobile/res/constants/app_colors.dart';

class NIButton extends StatefulWidget {
  final bool? value;
  final void Function(bool) onValueChanged;
  const NIButton({
    super.key,
    this.value,
    required this.onValueChanged,
  });

  @override
  State<NIButton> createState() => _NIButtonState();
}

class _NIButtonState extends State<NIButton> {
  bool _isClicked = false;

  @override
  void initState() {
    super.initState();
    if (widget.value == true) {
      _isClicked = true;
      setState(() {});
    }
  }

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
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 4.0),
        decoration: BoxDecoration(
          color: _isClicked ? AppColors.red : AppColors.lightRed,
          borderRadius: BorderRadius.circular(5.0),
        ),
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
