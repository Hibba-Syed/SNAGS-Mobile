import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iskaan_inspections_mobile/bloc/snags/snags_cubit.dart';
import 'package:iskaan_inspections_mobile/model/snag/snags_response_model.dart';
import 'package:iskaan_inspections_mobile/utils/routes/app_routes.dart';
import 'package:iskaan_inspections_mobile/view/helper/ui_helper.dart';
import 'package:iskaan_inspections_mobile/view/screens/snags/components/snag_widget.dart';
import 'package:iskaan_inspections_mobile/view/widgets/button/add_button_with_title.dart';
import 'package:iskaan_inspections_mobile/view/widgets/custom_loader.dart';
import 'package:iskaan_inspections_mobile/view/widgets/empty_widget.dart';
import 'package:iskaan_inspections_mobile/view/widgets/textfield/search_text_field.dart';

import '../../../bloc/communities/communities_cubit.dart';
import 'components/snags_filter_bottom_sheet.dart';

class SnagsScreen extends StatefulWidget {
  const SnagsScreen({super.key});

  @override
  State<SnagsScreen> createState() => _SnagsScreenState();
}

class _SnagsScreenState extends State<SnagsScreen> {
  final ScrollController _scrollController = ScrollController();
  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels >=
          _scrollController.position.maxScrollExtent) {
        context.read<SnagsCubit>().getMoreSnags();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<SnagsCubit, SnagsState>(
        builder: (context, state) {
          if (state.isLoading == true) {
            return const CustomLoader();
          }
          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: SearchTextField(
                  onFilterPressed: () {
                    _snagsFilterBottomSheet(context);
                  },
                ),
              ),
              UIHelper.verticalSpace(16.0),
              Expanded(
                child: state.snags?.isNotEmpty ?? false
                    ? RefreshIndicator(
                        onRefresh: () async {
                          await context.read<SnagsCubit>().getSnags();
                        },
                        child: ListView.separated(
                          itemCount: state.snags?.length ?? 0,
                          controller: _scrollController,
                          shrinkWrap: true,
                          physics: const AlwaysScrollableScrollPhysics(),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16.0, vertical: 10.0),
                          itemBuilder: (context, index) {
                            SnagModel item = state.snags![index];
                            return SnagWidget(
                              id: item.id,
                              imageUrl: item.images?.isNotEmpty ?? false
                                  ? item.images?.first.path
                                  : '',
                              reference: item.reference ?? '--',
                              risk: item.risk ?? '--',
                              status: item.status ?? '--',
                              title: item.title ?? '--',
                              description: item.description ?? '--',

                            );
                          },
                          separatorBuilder: (context, index) {
                            return UIHelper.verticalSpace(14.0);
                          },
                        ),
                      )
                    : const EmptyWidget(
                        text: 'No Snags found',
                      ),
              ),
              if (state.loadMore) const CustomLoader(),
            ],
          );
        },
      ),
      floatingActionButton: AddButtonWithTitle(
        title: 'Add Snag',
        onTap: () {
          Navigator.pushNamed(context, AppRoutes.addSnag);
        },
      ),
    );
  }
  _snagsFilterBottomSheet(context)  {
    showModalBottomSheet(
      //isScrollControlled: true,
      context: context,
      barrierColor: Colors.transparent,
      builder: (context) {
        context.read<CommunitiesCubit>().getCommunitiesFilter(context);
        return const SnagsFilterBottomSheet();
      },
    );
  }

}
