import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iskaan_inspections_mobile/bloc/snags/snag_detail/snag_detail_cubit.dart';
import 'package:iskaan_inspections_mobile/model/association/association_model.dart';
import 'package:iskaan_inspections_mobile/res/constants/app_colors.dart';
import 'package:iskaan_inspections_mobile/res/styles/styles.dart';
import 'package:iskaan_inspections_mobile/utils/routes/app_routes.dart';
import 'package:iskaan_inspections_mobile/view/helper/ui_helper.dart';
import 'package:iskaan_inspections_mobile/view/widgets/image/network_image_widget.dart';
import 'package:iskaan_inspections_mobile/view/widgets/risk_widget.dart';
import 'package:iskaan_inspections_mobile/view/widgets/status/snag_status_widget.dart';

class SnagWidget extends StatelessWidget {
  final int? id;
  final String? imageUrl;
  final String risk;
  final String status;
  final String reference;
  final String title;
  final String location;
  final Association? community;
  const SnagWidget({
    super.key,
    required this.id,
    required this.imageUrl,
    required this.risk,
    required this.status,
    required this.reference,
    required this.title,
    required this.location,
    this.community,
  });

  @override
  Widget build(BuildContext context) {
    double deviceWidth = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: () {
        if (id != null) {
          context.read<SnagDetailCubit>().onChangeCarouselIndex(0);
          context.read<SnagDetailCubit>().getSnagDetails(id: id!);
        }
        context.read<SnagDetailCubit>().onChangeReference(reference);
        Navigator.pushNamed(context, AppRoutes.snagDetail,arguments: community);
      },
      child: Container(
        width: deviceWidth,
        height: 120,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Row(
          children: [
            NetworkImageWidget(
              url: imageUrl,
              width: deviceWidth / 3,
              height: 120,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        RiskWidget(
                          risk: risk,
                        ),
                        SnagStatusWidget(
                          status: status,
                        ),
                      ],
                    ),
                    UIHelper.verticalSpace(6.0),
                    Flexible(
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              reference,
                              style: AppTextStyles.style16DarkGrey600,
                            ),
                            UIHelper.verticalSpace(5.0),
                            Text(
                              title,
                              style: AppTextStyles.style14LightGrey500,
                            ),
                            UIHelper.verticalSpace(3.0),
                            Text(
                              location,
                              style: AppTextStyles.style12LightGrey400,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
