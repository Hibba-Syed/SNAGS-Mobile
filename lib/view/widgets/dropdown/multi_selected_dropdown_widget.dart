
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:iskaan_inspections_mobile/res/constants/app_colors.dart';
import 'package:iskaan_inspections_mobile/res/styles/styles.dart';
import 'package:iskaan_inspections_mobile/view/helper/ui_helper.dart';

class MultiSelectedDropdownWidget<T> extends StatelessWidget {
  final String? label;
  final String? hint;
  final List<T>? selectedItems ;
  final List<T> items;
  final String Function(T)? itemAsString;
  final bool Function(T, T)? compareFn;
  final void Function(List<T>)? onChanged;
  final bool enabled;
  final String? Function(List<T>?)? validator;
  final Icon? icon;
  final InputBorder? border;
  final Color? fillColor;

  const MultiSelectedDropdownWidget({
    super.key,
    this.label,
    this.hint,
    required this.selectedItems,
    required this.items,
    this.itemAsString,
    this.compareFn,
    required this.onChanged,
    this.enabled = true,
    this.validator,
    this.icon,
    this.border,
    this.fillColor,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if(label?.isNotEmpty??false)
          Text(label!,style: AppTextStyles.style16LightGrey400,),
        if(label?.isNotEmpty??false)
          UIHelper.verticalSpace(8.0),
        DropdownSearch<T>.multiSelection(
          enabled: enabled,
          dropdownButtonProps: icon!=null? DropdownButtonProps(
            icon: icon!,
          ):const DropdownButtonProps(),
          dropdownDecoratorProps:  DropDownDecoratorProps(
            textAlign: TextAlign.left,
            textAlignVertical: TextAlignVertical.center,
            dropdownSearchDecoration: InputDecoration(
                contentPadding:
                const EdgeInsets.symmetric(horizontal: 15.0, vertical: 4.0),
                hintText: hint,
                hintStyle: AppTextStyles.style12LightGrey400,
                floatingLabelBehavior: FloatingLabelBehavior.never,
                alignLabelWithHint: false,
                fillColor:fillColor ?? AppColors.white,
                filled: true,
                // border: border ?? InputBorder.none,
                disabledBorder: border?? InputBorder.none,
                enabledBorder: border??InputBorder.none,
                focusedBorder: border??InputBorder.none

            ),
          ),
          selectedItems: selectedItems??[],
          items: items,
          itemAsString: itemAsString,
          compareFn: compareFn,
          popupProps: const PopupPropsMultiSelection.menu(showSearchBox: true),
          onChanged: onChanged,
          validator: validator,
        ),
      ],
    );
  }
}
