import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iskaan_inspections_mobile/bloc/communities/communities_cubit.dart';
import 'package:iskaan_inspections_mobile/bloc/communities/detail/community_detail_inspections/community_detail_inspections_cubit.dart';
import 'package:iskaan_inspections_mobile/bloc/communities/detail/community_detail_snags/community_detail_snags_cubit.dart';
import 'package:iskaan_inspections_mobile/bloc/communities/detail/community_details_statistics/community_detail_statistics_cubit.dart';
import 'package:iskaan_inspections_mobile/model/association/association_model.dart';
import 'package:iskaan_inspections_mobile/utils/routes/app_routes.dart';
import 'package:iskaan_inspections_mobile/view/helper/ui_helper.dart';
import 'package:iskaan_inspections_mobile/view/screens/communities/components/community_widget.dart';
import 'package:iskaan_inspections_mobile/view/widgets/custom_loader.dart';
import 'package:iskaan_inspections_mobile/view/widgets/empty_widget.dart';
import 'package:iskaan_inspections_mobile/view/widgets/textfield/search_text_field.dart';

class CommunitiesScreen extends StatefulWidget {
  const CommunitiesScreen({super.key});

  @override
  State<CommunitiesScreen> createState() => _CommunitiesScreenState();
}

class _CommunitiesScreenState extends State<CommunitiesScreen> {
  final ScrollController _scrollController = ScrollController();
  @override
  void initState() {
    super.initState();
    // _scrollController.addListener(() {
    //   if (_scrollController.position.pixels >=
    //       _scrollController.position.maxScrollExtent) {
    //     context.read<CommunitiesCubit>().getMoreCommunities();
    //   }
    // });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CommunitiesCubit, CommunitiesState>(
      builder: (context, state) {
        if (state.isLoading == true) {
          return const CustomLoader();
        }
        return Column(
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
              child: SearchTextField(),
            ),
            Expanded(
              child: state.communities?.isNotEmpty ?? false
                  ? RefreshIndicator(
                      onRefresh: () async {
                        await context.read<CommunitiesCubit>().getCommunities();
                      },
                      child: ListView.separated(
                        itemCount: state.communities?.length ?? 0,
                        shrinkWrap: true,
                        physics: const AlwaysScrollableScrollPhysics(),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16.0, vertical: 10.0),
                        itemBuilder: (context, index) {
                          Association item = state.communities![index];
                          return CommunityWidget(
                            communityName: item.name ?? '--',
                            companyName: item.company?.name ?? '--',
                            onTap: () {
                              context
                                  .read<CommunityDetailStatisticsCubit>()
                                  .onChangeId(item.id);
                              context
                                  .read<CommunityDetailInspectionsCubit>()
                                  .onChangeCommunity(item);
                              context
                                  .read<CommunityDetailSnagsCubit>()
                                  .onChangeCommunity(item);
                              // context
                              //     .read<CommunityDetailStatisticsCubit>()
                              //     .getCommunitySnagsStatistics();
                              context
                                  .read<CommunityDetailStatisticsCubit>()
                                  .getCommunityInspectionsStatistics();
                              context
                                  .read<CommunityDetailInspectionsCubit>()
                                  .getCommunityInspections();
                              context
                                  .read<CommunityDetailSnagsCubit>()
                                  .getCommunitySnags();

                              Navigator.pushNamed(
                                  context, AppRoutes.communityDetail,
                                  arguments: {'name': item.name});
                            },
                          );
                        },
                        separatorBuilder: (context, index) {
                          return UIHelper.verticalSpace(10.0);
                        },
                      ),
                    )
                  : const EmptyWidget(
                      text: 'No Communities found',
                    ),
            ),
            if (state.loadMore) const CustomLoader(),
          ],
        );
      },
    );
  }
}
