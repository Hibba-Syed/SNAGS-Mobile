import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:iskaan_inspections_mobile/res/constants/app_colors.dart';
import 'package:iskaan_inspections_mobile/res/styles/styles.dart';
import 'package:iskaan_inspections_mobile/view/helper/ui_helper.dart';
import 'package:iskaan_inspections_mobile/view/screens/inspection/components/ni_button.dart';
import 'package:iskaan_inspections_mobile/view/screens/inspection/components/zero_rating_widget.dart';
import 'package:iskaan_inspections_mobile/view/widgets/textfield/text_field_widget.dart';

class InspectionCategoryItemWidget extends StatefulWidget {
  final String title;
  final int? rating;
  final String? note;
  final void Function(int?) onRatingUpdate;
  final void Function(String)? onNoteChanged;
  final void Function() onScoreUpdate;
  const InspectionCategoryItemWidget({
    super.key,
    required this.title,
    this.rating,
    this.note,
    required this.onRatingUpdate,
    required this.onNoteChanged,
    required this.onScoreUpdate,
  });

  @override
  State<InspectionCategoryItemWidget> createState() =>
      _InspectionCategoryItemWidgetState();
}

class _InspectionCategoryItemWidgetState
    extends State<InspectionCategoryItemWidget> {
  final TextEditingController _noteController = TextEditingController();
  bool _isRatingIgnored = false;
  bool _isRatingChanged = false;
  bool _isNotInspectable = false;
  int? _rating;

  @override
  void initState() {
    super.initState();
    _rating = widget.rating;
    _noteController.text = widget.note ?? '';
    if (_rating == -1) {
      _isNotInspectable = true;
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.all(10.0),
          decoration: BoxDecoration(
              color: AppColors.white, borderRadius: BorderRadius.circular(5.0)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.title,
                style: AppTextStyles.style14LightGrey600,
              ),
              UIHelper.verticalSpace(16.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ZeroRatingButton(
                    onTap: () {
                      if (!_isRatingChanged) {
                        widget.onScoreUpdate();
                      }
                      setState(() {
                        _rating = 0;
                        _isRatingChanged = true;
                      });
                      widget.onRatingUpdate(_rating);
                    },
                  ),
                  RatingBar(
                    unratedColor: AppColors.yellow,
                    allowHalfRating: false,
                    glow: false,
                    itemSize: 24,
                    initialRating: _rating?.toDouble() ?? 0.0,
                    ignoreGestures: _isRatingIgnored,
                    ratingWidget: RatingWidget(
                      full: const Icon(
                        Icons.star,
                        color: AppColors.yellow,
                      ),
                      half: const Icon(
                        Icons.star_half,
                        color: AppColors.yellow,
                      ),
                      empty: Icon(
                        Icons.star_outline,
                        color:
                            _isRatingChanged ? AppColors.yellow : AppColors.red,
                      ),
                    ),
                    onRatingUpdate: (value) {
                      if (!_isRatingChanged) {
                        widget.onScoreUpdate();
                      }
                      setState(() {
                        _rating = value.toInt();
                        _isRatingChanged = true;
                      });
                      widget.onRatingUpdate(value.toInt());
                    },
                  ),
                  NIButton(
                    value: _isNotInspectable,
                    onValueChanged: (value) {
                      if (!_isRatingChanged) {
                        widget.onScoreUpdate();
                      }
                      setState(
                        () {
                          _isNotInspectable = value;
                          _isRatingIgnored = value;
                          _rating = 0;
                          _isRatingChanged = true;
                          if (value) {
                            widget.onRatingUpdate(-1);
                          } else {
                            widget.onRatingUpdate(_rating);
                          }
                        },
                      );
                    },
                  ),
                ],
              ),
              UIHelper.verticalSpace(16.0),
              TextFieldWidget(
                controller: _noteController,
                hint: 'Write your note here...',
                validator: _isNotInspectable
                    ? (value) {
                        if (value?.isEmpty ?? true) {
                          return 'required';
                        }
                        return null;
                      }
                    : null,
                onChanged: widget.onNoteChanged,
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 15.0, vertical: 6.0),
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
            ],
          ),
        ),
      ],
    );
  }
}
