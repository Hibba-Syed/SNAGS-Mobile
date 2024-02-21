import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:iskaan_inspections_mobile/res/constants/app_colors.dart';
import 'package:iskaan_inspections_mobile/res/styles/styles.dart';
import 'package:iskaan_inspections_mobile/view/helper/ui_helper.dart';

class DropdownWidget<T> extends StatelessWidget {
  final String? label;
  final String? hint;
  final T? selectedItem;
  final List<T> items;
  final String Function(T)? itemAsString;
  final bool Function(T, T)? compareFn;
  final void Function(T?)? onChanged;
  final bool enabled;
  final String? Function(T?)? validator;
  final Icon? icon;
  final InputBorder? border;

  const DropdownWidget({
    super.key,
     this.label,
    this.hint,
    required this.selectedItem,
    required this.items,
    this.itemAsString,
    this.compareFn,
    required this.onChanged,
    this.enabled = true,
    this.validator,
    this.icon,
    this.border,
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
        DropdownSearch<T>(
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
              fillColor: AppColors.white,
              filled: true,
              border: border,
            ),
          ),
          selectedItem: selectedItem,
          items: items,
          itemAsString: itemAsString,
          compareFn: compareFn,
          popupProps: const PopupProps.menu(showSearchBox: true),
          onChanged: onChanged,
          validator: validator,
        ),
      ],
    );
  }
}
