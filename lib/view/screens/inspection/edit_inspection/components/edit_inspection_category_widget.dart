import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:iskaan_inspections_mobile/model/inspection/inspection_details_response_model.dart';
import 'package:iskaan_inspections_mobile/model/inspector_model.dart';
import 'package:iskaan_inspections_mobile/res/constants/app_colors.dart';
import 'package:iskaan_inspections_mobile/res/styles/styles.dart';
import 'package:iskaan_inspections_mobile/view/helper/ui_helper.dart';
import 'package:iskaan_inspections_mobile/view/screens/inspection/components/inspection_category_item_widget.dart';
import 'package:iskaan_inspections_mobile/view/widgets/button/custom_button.dart';
import 'package:iskaan_inspections_mobile/view/widgets/dropdown/dropdown_widget.dart';
import 'package:iskaan_inspections_mobile/view/widgets/textfield/text_field_widget.dart';

class EditInspectionCategoryWidget extends StatefulWidget {
  final List<Inspector>? inspectors;
  final InspectionCategory inspectionCategory;
  final ValueChanged onUpdatePressed;

  const EditInspectionCategoryWidget({
    super.key,
    required this.inspectors,
    required this.inspectionCategory,
    required this.onUpdatePressed,
  });

  @override
  State<EditInspectionCategoryWidget> createState() =>
      _EditInspectionCategoryWidgetState();
}

class _EditInspectionCategoryWidgetState
    extends State<EditInspectionCategoryWidget> {
  final TextEditingController _categoryNoteController = TextEditingController();
  bool _isExpanded = false;
  double _totalScore = 0.0;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final ExpandableController _expandableController = ExpandableController();
  Map<String, dynamic> _categoryFormData = {};

  @override
  void initState() {
    super.initState();
    _categoryFormData = {
      "category_id": widget.inspectionCategory.id,
      "note": widget.inspectionCategory.note,
    };
    _categoryNoteController.text = widget.inspectionCategory.note ?? '';
    _totalScore = widget.inspectionCategory.score ?? 0.0;
    widget.inspectionCategory.items?.forEach((element) {
      _categoryFormData["item_${element.id}"] = <String, dynamic>{
        "note": element.note,
        "rating": element.rating,
      };
    });
    setState(() {});
    print(_categoryFormData);
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
                    widget.inspectionCategory.title ?? '--',
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
                if (widget.inspectors?.isNotEmpty ?? false)
                  DropdownWidget<Inspector>(
                    hint: 'Select inspector',
                    selectedItem: null,
                    items: widget.inspectors ?? [],
                    onChanged: (inspector) {
                      _categoryFormData['inspector'] = inspector?.id;
                    },
                    itemAsString: (inspector) => inspector.fullName ?? '',
                    compareFn: (inspector, item) => inspector.id == item.id,
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
                    itemCount: widget.inspectionCategory.items?.length ?? 0,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      InspectionCategoryItem? item =
                          widget.inspectionCategory.items?[index];
                      return InspectionCategoryItemWidget(
                        title: item?.title ?? '--',
                        note: _categoryFormData["item_${item?.id}"]['note'],
                        rating: _categoryFormData["item_${item?.id}"]['rating'],
                        onRatingUpdate: (value) {
                          _categoryFormData["item_${item?.id}"]['rating'] =
                              value;
                        },
                        onNoteChanged: (value) {
                          _categoryFormData["item_${item?.id}"]['note'] = value;
                        },
                        onScoreUpdate: () {
                          _totalScore = _totalScore +
                              (100 / widget.inspectionCategory.items!.length);
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
                  controller: _categoryNoteController,
                  hint: 'Write your category note here...',
                  maxLines: 3,
                  onChanged: (value) {
                    _categoryFormData['note'] = value;
                  }, //widget.onCategoryNoteChanged,
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
                  text: 'Update',
                  onPressed: () {
                    print(_categoryFormData);
                    if (_formKey.currentState!.validate()) {
                      widget.onUpdatePressed(_categoryFormData);
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
