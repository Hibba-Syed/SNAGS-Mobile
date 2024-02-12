import 'dart:io';
import 'package:flutter/material.dart';
import 'package:iskaan_inspections_mobile/res/constants/app_colors.dart';
import 'package:iskaan_inspections_mobile/utils/validation_util.dart';

import 'network_image_widget.dart';

class ImageAvatarWidget extends StatelessWidget {
  final String? imageUrl;
  final VoidCallback? onEditPressed;
  final File? imageFile;
  const ImageAvatarWidget(
      {Key? key, this.imageUrl, this.onEditPressed, this.imageFile})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onEditPressed,
      child: Center(
        child: (imageFile != null && imageFile!.path.isNotEmpty)
            ? Container(
                decoration: const BoxDecoration(shape: BoxShape.circle),
                clipBehavior: Clip.antiAliasWithSaveLayer,
                child: Image.file(
                  imageFile!,
                  width: 98.0,
                  height: 98.0,
                  fit: BoxFit.fill,
                ),
              )
            : ValidationUtil.isValid(imageUrl)
                ? NetworkImageWidget(
                    url: imageUrl!,
                    width: 98.0,
                    height: 98.0,
                    fit: BoxFit.fill,
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: AppColors.lightGrey,
                    ),
                  )
                : Container(
                    width: 98.0,
                    height: 98.0,
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: AppColors.lightGrey,
                      ),
                    ),
                    child: const Padding(
                        padding: EdgeInsets.all(20.0), child: Icon(Icons.add)),
                  ),
      ),
    );
  }
}
