import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:iskaan_inspections_mobile/res/constants/app_colors.dart';
import 'package:iskaan_inspections_mobile/res/styles/styles.dart';
import 'package:iskaan_inspections_mobile/view/helper/ui_helper.dart';

class TextFieldWidget extends StatelessWidget {
  final String? initialValue;
  final String? label;
  final String? hint;
  final TextEditingController? controller;
  final void Function(String)? onChanged;
  final void Function(String)? onFieldSubmitted;
  final void Function()? onEditingComplete;
  final void Function(String?)? onSaved;
  final void Function()? onTap;
  final List<TextInputFormatter>? inputFormatters;
  final String? Function(String?)? validator;
  final TextInputAction textInputAction;
  final TextInputType keyboardType;
  final bool obscureText;
  final bool readOnly;
  final int? maxLines;
  final int? maxLength;
  final bool expands;
  final Widget? prefix;
  final Widget? suffix;
  final Color? fillColor;
  final InputBorder? focusedBorder;
  final InputBorder? enabledBorder;
  final InputBorder? errorBorder;
  final InputBorder? focusedErrorBorder;
  final EdgeInsetsGeometry? contentPadding;

  const TextFieldWidget({
    super.key,
    this.initialValue,
    this.label,
    this.hint,
    this.controller,
    this.onChanged,
    this.onFieldSubmitted,
    this.onEditingComplete,
    this.onSaved,
    this.onTap,
    this.inputFormatters,
    this.validator,
    this.textInputAction = TextInputAction.done,
    this.keyboardType = TextInputType.text,
    this.obscureText = false,
    this.readOnly = false,
    this.maxLines,
    this.maxLength,
    this.expands = false,
    this.prefix,
    this.suffix,
    this.fillColor,
    this.enabledBorder,
    this.focusedBorder,
    this.errorBorder,
    this.focusedErrorBorder,
    this.contentPadding,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (label?.isNotEmpty ?? false)
          Text(
            label!,
            style: AppTextStyles.style16LightGrey400,
          ),
        if (label?.isNotEmpty ?? false) UIHelper.verticalSpace(8.0),
        TextFormField(
          initialValue: initialValue,
          controller: controller,
          onChanged: onChanged,
          onFieldSubmitted: onFieldSubmitted,
          onEditingComplete: onEditingComplete,
          onSaved: onSaved,
          inputFormatters: inputFormatters ?? [],
          validator: validator,
          textInputAction: textInputAction,
          keyboardType: keyboardType,
          obscureText: obscureText,
          readOnly: readOnly,
          onTap: onTap,
          maxLines: maxLines,
          maxLength: maxLength,
          expands: expands,
          decoration: InputDecoration(
            isDense: true,
            contentPadding:contentPadding??
                const EdgeInsets.symmetric(horizontal: 15.0, vertical: 12.0),
            hintText: hint,
            hintStyle: AppTextStyles.style12LightGrey400,
            floatingLabelBehavior: FloatingLabelBehavior.never,
            prefixIcon: prefix,
            suffixIcon: suffix,
            alignLabelWithHint: false,
            fillColor: fillColor ?? AppColors.white,
            filled: true,
            focusedBorder: focusedBorder,
            enabledBorder: enabledBorder,
            errorBorder: errorBorder,
            focusedErrorBorder: focusedErrorBorder,
          ),
        )
      ],
    );
  }
}
