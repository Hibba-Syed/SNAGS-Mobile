import 'package:flutter/material.dart';
import 'package:iskaan_inspections_mobile/res/constants/app_colors.dart';
import 'package:iskaan_inspections_mobile/res/styles/styles.dart';
import 'package:iskaan_inspections_mobile/view/helper/ui_helper.dart';

class CustomButton extends StatelessWidget {
  final Color? buttonColor;
  final String text;
  final Widget? icon;
  final Color textColor;
  final TextAlign? textAlign;
  final VoidCallback onPressed;
  final int maxLines;
  final bool invert;
  final double? width;
  final double? height;
  final EdgeInsets padding;
  final FontWeight fontWeight;
  final double fontSize;
  const CustomButton(
      {Key? key,
      this.buttonColor,
      required this.text,
      this.textAlign,
      this.width,
      this.icon,
      this.height = 50,
      this.fontSize = 13,
      this.maxLines = 5,
      this.padding = const EdgeInsets.all(10),
      this.textColor = AppColors.white,
      required this.onPressed,
      this.invert = false,
      this.fontWeight = FontWeight.bold})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        alignment: Alignment.center,
        padding: padding,
        width: width,
        height: height,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: invert == true
                ? Border.all(color: buttonColor ?? AppColors.primary, width: 1)
                : null,
            color: invert == true ? null : buttonColor ?? AppColors.primary),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (icon != null) icon!,
            if (icon != null)
              UIHelper.horizontalSpace(10.0),
            Flexible(
              child: Text(
                text,
                style: invert?AppTextStyles.style16Primary500:AppTextStyles.style16White500,
                textAlign: textAlign,
                maxLines: maxLines,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
