import 'package:flutter/material.dart';
import 'package:iskaan_inspections_mobile/res/constants/app_colors.dart';
import 'package:iskaan_inspections_mobile/res/styles/styles.dart';
import 'package:iskaan_inspections_mobile/view/helper/ui_helper.dart';

class SearchTextField extends StatelessWidget {
  final String? initialValue;
  final String hint;
  final TextEditingController? controller;
  final void Function(String)? onChanged;
  final void Function(String)? onFieldSubmitted;
  final VoidCallback? onFilterPressed;
  final bool isFilterApplied;
  final Color? fillColor;
  const SearchTextField({
    super.key,
    this.initialValue,
    this.hint = 'Search',
    this.controller,
    this.onChanged,
    this.onFieldSubmitted,
    this.onFilterPressed,
    this.isFilterApplied=false,
    this.fillColor,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            clipBehavior: Clip.antiAliasWithSaveLayer,
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(5.0),
            ),
            child: TextFormField(
              initialValue: initialValue,
              controller: controller,
              onChanged: onChanged,
              onFieldSubmitted: onFieldSubmitted,
              textInputAction: TextInputAction.done,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(
                    horizontal: 15.0, vertical: 10.0),
                hintText: hint,
                hintStyle: AppTextStyles.style14LightGrey400,
                floatingLabelBehavior: FloatingLabelBehavior.never,
                suffixIcon: const Icon(
                  Icons.search,
                  color: AppColors.lightGrey,
                ),
                alignLabelWithHint: false,
                fillColor: fillColor??AppColors.white,
                filled: true,
                border: InputBorder.none,
              ),
            ),
          ),
        ),
        if (onFilterPressed != null) UIHelper.horizontalSpace(10.0),
        if (onFilterPressed != null)
          Stack(
            children: [
              InkWell(
                onTap: onFilterPressed,
                child: Container(
                  width: 48.0,
                  height: 48.0,
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  child: const Icon(
                    Icons.filter_alt_outlined,
                    color: AppColors.lightGrey,
                  ),
                ),
              ),
              if(isFilterApplied)
              const Positioned(
                right: 10.0,
                top: 10.0,
                child: Icon(
                  Icons.circle,
                  color: AppColors.green,
                  size: 10.0,
                ),
              ),
            ],
          ),
      ],
    );
  }
}
