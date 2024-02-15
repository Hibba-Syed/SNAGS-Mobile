import 'package:flutter/material.dart';
import 'package:iskaan_inspections_mobile/res/constants/app_colors.dart';
import 'package:iskaan_inspections_mobile/view/helper/ui_helper.dart';

class SnagDetailContainer extends StatefulWidget {
  final Widget header;
  final Widget child;
  const SnagDetailContainer({
    super.key,
    required this.header,
    required this.child,
  });

  @override
  State<SnagDetailContainer> createState() => _SnagDetailContainerState();
}

class _SnagDetailContainerState extends State<SnagDetailContainer> {
  bool _isChildExpanded = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
      padding: const EdgeInsets.all(8.0),
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(10.0),

      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
            onTap: () {
              setState(() {
                _isChildExpanded = !_isChildExpanded;
              });
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                widget.header,
                Icon(
                  _isChildExpanded
                      ? Icons.keyboard_arrow_up
                      : Icons.keyboard_arrow_down,
                  color: AppColors.grey,
                ),
              ],
            ),
          ),
          if (_isChildExpanded) UIHelper.verticalSpace(16.0),
          if (_isChildExpanded) widget.child,
        ],
      ),
    );
  }
}
