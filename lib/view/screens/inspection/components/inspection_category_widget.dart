import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:iskaan_inspections_mobile/res/constants/app_colors.dart';
import 'package:iskaan_inspections_mobile/res/styles/styles.dart';
import 'package:iskaan_inspections_mobile/view/helper/ui_helper.dart';
import 'package:iskaan_inspections_mobile/view/screens/inspection/components/inspection_category_item_widget.dart';
import 'package:iskaan_inspections_mobile/view/screens/inspection/components/model/inspection_category_item_model.dart';
import 'package:iskaan_inspections_mobile/view/widgets/button/custom_button.dart';
import 'package:iskaan_inspections_mobile/view/widgets/dropdown/dropdown_widget.dart';
import 'package:iskaan_inspections_mobile/view/widgets/textfield/text_field_widget.dart';

class InspectionCategoryWidget extends StatefulWidget {
  final String categoryTitle;
  final List<InspectionCategoryItemModel> inspectionCategoryItems;
  final VoidCallback onSavePressed;
  final void Function(int index, double? value)? onCategoryItemRatingUpdate;
  final void Function(int index, String value)? onCategoryItemNoteChanged;
  final void Function(String)? onCategoryNoteChanged;

  const InspectionCategoryWidget({
    super.key,
    required this.categoryTitle,
    required this.inspectionCategoryItems,
    this.onCategoryItemRatingUpdate,
    this.onCategoryItemNoteChanged,
    this.onCategoryNoteChanged,
    required this.onSavePressed,
  });

  @override
  State<InspectionCategoryWidget> createState() =>
      _InspectionCategoryWidgetState();
}

class _InspectionCategoryWidgetState extends State<InspectionCategoryWidget> {
  bool _isExpanded = false;
  double _totalScore = 0.0;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final ExpandableController _expandableController = ExpandableController();

  @override
  void initState() {
    super.initState();
    _expandableController.addListener(() {
      setState(() {
        _isExpanded = _expandableController.expanded;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ExpandablePanel(
          controller: _expandableController,
          theme: const ExpandableThemeData(
            hasIcon: false,
          ),
          header: Container(
            padding: const EdgeInsets.all(12.0),
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  child: Text(
                    widget.categoryTitle,
                    style: AppTextStyles.style16Grey600,
                  ),
                ),
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 6.0, vertical: 2.0),
                      decoration: BoxDecoration(
                        color: AppColors.lightGreen,
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      child: RichText(
                        text: TextSpan(
                          text: 'Total Score: ',
                          style: AppTextStyles.style12Green600,
                          children: [
                            TextSpan(
                              text:
                                  '${_totalScore == 100 ? 100 : _totalScore.toStringAsFixed(2)}%',
                              style: AppTextStyles.style12Green400,
                            ),
                          ],
                        ),
                      ),
                    ),
                    Icon(
                      _isExpanded
                          ? Icons.keyboard_arrow_up
                          : Icons.keyboard_arrow_down,
                      color: AppColors.lightGrey,
                    ),
                  ],
                ),
              ],
            ),
          ),
          collapsed: const SizedBox.shrink(),
          expanded: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Column(
              children: [
                UIHelper.verticalSpace(10.0),
                DropdownWidget<String>(
                  hint: 'Select inspector',
                  selectedItem: null,
                  items: const ['A', 'B', 'C'],
                  onChanged: (value) {},
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide.none,
                  ),
                  icon: const Icon(
                    Icons.keyboard_arrow_down,
                    color: AppColors.lightGrey,
                  ),
                ),
                UIHelper.verticalSpace(10.0),
                Form(
                  key: _formKey,
                  child: ListView.separated(
                    itemCount: widget.inspectionCategoryItems.length,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      InspectionCategoryItemModel item =
                          widget.inspectionCategoryItems[index];
                      return InspectionCategoryItemWidget(
                        title: item.title ?? '--',
                        onRatingUpdate: (value) {
                          if (widget.onCategoryItemRatingUpdate != null) {
                            widget.onCategoryItemRatingUpdate!(index, value);
                          }
                        },
                        onScoreUpdate: () {
                          _totalScore = _totalScore +
                              (100 / widget.inspectionCategoryItems.length);
                          setState(() {});
                        },
                      );
                    },
                    separatorBuilder: (context, index) {
                      return UIHelper.verticalSpace(10.0);
                    },
                  ),
                ),
                UIHelper.verticalSpace(20.0),
                TextFieldWidget(
                  hint: 'Write your category note here...',
                  maxLines: 3,
                  onChanged: widget.onCategoryNoteChanged,
                  contentPadding: const EdgeInsets.symmetric(
                      horizontal: 15.0, vertical: 6.0),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                    borderSide: const BorderSide(
                      color: AppColors.primary,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                    borderSide: const BorderSide(
                      color: AppColors.lightGrey,
                    ),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                    borderSide: const BorderSide(
                      color: AppColors.red,
                    ),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                    borderSide: const BorderSide(
                      color: AppColors.red,
                    ),
                  ),
                ),
                UIHelper.verticalSpace(10.0),
                CustomButton(
                  buttonColor: AppColors.cGreen,
                  text: 'Save',
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      widget.onSavePressed();
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
