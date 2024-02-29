import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:iskaan_inspections_mobile/res/constants/app_colors.dart';
import 'package:iskaan_inspections_mobile/utils/validation_util.dart';


class NetworkImageWidget extends StatelessWidget {
  final String? url;
  final double width;
  final double height;
  final BoxFit? fit;
  final BoxShape shape;
  final BoxBorder? border;
  final BorderRadiusGeometry? borderRadius;
  final Widget? placeHolder;

  NetworkImageWidget(
      {Key? key,
      required this.url,
      this.width = 56.0,
      this.height = 50.0,
      this.fit = BoxFit.cover,
      this.shape = BoxShape.rectangle,
      this.border,
      this.borderRadius,
      this.placeHolder})
      : super(key: key);

  late Widget _placeHolder;

  @override
  Widget build(BuildContext context) {

      _placeHolder = Container(
        width: width,
        height: height,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Colors.grey.shade300,
          shape: shape,
        ),
        child: placeHolder ?? const Icon(
          Icons.image_outlined,
          color: AppColors.lightGrey,
        ),
      );

    return !ValidationUtil.isValid(url)?
         _placeHolder
        : CachedNetworkImage(
            imageUrl: url!,
            imageBuilder: (context, imageProvider) => Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: imageProvider,
                  fit: fit,
                ),
                shape: shape,
                border: border,
                borderRadius: borderRadius
              ),
            ),
            width: width,
            height: height,
            fit: fit,
            errorWidget: (context, url, error) => _placeHolder,
            placeholder: (context, url) => _placeHolder,
          );
  }
}
