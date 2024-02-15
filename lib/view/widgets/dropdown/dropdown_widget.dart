import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:iskaan_inspections_mobile/res/constants/app_colors.dart';
import 'package:iskaan_inspections_mobile/res/styles/styles.dart';
import 'package:iskaan_inspections_mobile/view/helper/ui_helper.dart';

class DropdownWidget<T> extends StatelessWidget {
  final String label;
  final String? hint;
  final T? selectedItem;
  final List<T> items;
  final String Function(T)? itemAsString;
  final bool Function(T, T)? compareFn;
  final void Function(T?)? onChanged;
  final bool enabled;
  final String? Function(T?)? validator;
  const DropdownWidget({
    super.key,
    required this.label,
    this.hint,
    required this.selectedItem,
    required this.items,
    this.itemAsString,
    this.compareFn,
    required this.onChanged,
    this.enabled = true,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label,style: AppTextStyles.style16LightGrey400,),
        UIHelper.verticalSpace(8.0),
        DropdownSearch<T>(
          enabled: enabled,
          dropdownDecoratorProps:  DropDownDecoratorProps(
            textAlign: TextAlign.left,
            textAlignVertical: TextAlignVertical.center,
            dropdownSearchDecoration: InputDecoration(
              contentPadding:
              const EdgeInsets.symmetric(horizontal: 15.0, vertical: 4.0),
              hintText: hint,
              floatingLabelBehavior: FloatingLabelBehavior.never,
              alignLabelWithHint: false,
              fillColor: AppColors.white,
              filled: true,
              // border: InputBorder.none,
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
