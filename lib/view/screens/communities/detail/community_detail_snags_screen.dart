import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iskaan_inspections_mobile/bloc/communities/detail/community_detail_snags/community_detail_snags_cubit.dart';
import 'package:iskaan_inspections_mobile/bloc/snags/snag_detail/snag_detail_cubit.dart';
import 'package:iskaan_inspections_mobile/model/snag/snag_model.dart';
import 'package:iskaan_inspections_mobile/res/constants/constants.dart';
import 'package:iskaan_inspections_mobile/utils/routes/app_routes.dart';
import 'package:iskaan_inspections_mobile/view/helper/ui_helper.dart';
import 'package:iskaan_inspections_mobile/view/screens/snags/components/snag_widget.dart';
import 'package:iskaan_inspections_mobile/view/widgets/button/add_button_with_title.dart';
import 'package:iskaan_inspections_mobile/view/widgets/custom_loader.dart';
import 'package:iskaan_inspections_mobile/view/widgets/empty_widget.dart';
import 'package:iskaan_inspections_mobile/view/widgets/textfield/search_text_field.dart';

class CommunityDetailSnagsScreen extends StatelessWidget {
  const CommunityDetailSnagsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<CommunityDetailSnagsCubit, CommunityDetailSnagsState>(
        builder: (context, state) {
          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: SearchTextField(
                  onFilterPressed: () {},
                ),
              ),
              UIHelper.verticalSpace(16.0),
              Expanded(
                child: state.isLoading
                    ? const CustomLoader()
                    : (state.snags?.isEmpty ?? true)
                        ? const EmptyWidget(
                            text: 'No Snags found',
                          )
                        : ListView.separated(
                            itemCount: state.snags?.length ?? 0,
                            shrinkWrap: true,
                            physics: const AlwaysScrollableScrollPhysics(),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16.0, vertical: 10.0),
                            itemBuilder: (context, index) {
                              SnagModel? snag = state.snags?[index];
                              return SnagWidget(
                                id: snag?.id,
                                imageUrl: (snag?.status ==
                                            AppConstants.snagCompleted.title ||
                                        snag?.status ==
                                            AppConstants.snagCancelled.title)
                                    ? snag?.closingImages?.isNotEmpty ?? false
                                        ? snag?.closingImages?.first.path
                                        : ''
                                    : snag?.images?.isNotEmpty ?? false
                                        ? snag?.images?.first.path
                                        : '',
                                reference: snag?.reference ?? '--',
                                risk: snag?.risk ?? '--',
                                status: snag?.status ?? '--',
                                title: snag?.description ?? '--',
                                location: snag?.location ?? '--',
                                onTap: (){
                                  if (snag?.id != null) {
                                    context.read<SnagDetailCubit>().onChangeCarouselIndex(0);
                                    context.read<SnagDetailCubit>().getSnagDetails(id: snag!.id!);
                                  }
                                  context.read<SnagDetailCubit>().onChangeReference(snag?.reference);
                                  Navigator.pushNamed(
                                    context,
                                    AppRoutes.snagDetail,
                                    arguments: {
                                      'is_from_community': true,
                                    },
                                  );
                                },
                              );
                            },
                            separatorBuilder: (context, index) {
                              return UIHelper.verticalSpace(14.0);
                            },
                          ),
              ),
            ],
          );
        },
      ),
      floatingActionButton: AddButtonWithTitle(
        title: 'Add Snag',
        onTap: () {
          Navigator.pushNamed(context, AppRoutes.addSnag,
              arguments:
                  context.read<CommunityDetailSnagsCubit>().state.community);
        },
      ),
    );
  }
}
