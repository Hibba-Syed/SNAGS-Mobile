import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iskaan_inspections_mobile/bloc/inspection/detail/inspection_details_cubit.dart';
import 'package:iskaan_inspections_mobile/res/constants/app_colors.dart';
import 'package:iskaan_inspections_mobile/view/screens/inspection/detail/inspection_detail_details_screen.dart';
import 'package:iskaan_inspections_mobile/view/screens/inspection/detail/inspection_detail_logs_screen.dart';
import 'package:iskaan_inspections_mobile/view/screens/inspection/detail/inspection_detail_snags_screen.dart';
import 'package:iskaan_inspections_mobile/view/widgets/app_bar/appbar_widget.dart';
import 'package:iskaan_inspections_mobile/view/widgets/custom_loader.dart';
import 'package:iskaan_inspections_mobile/view/widgets/empty_widget.dart';
import 'package:iskaan_inspections_mobile/view/widgets/tab_bar/tab_bar_item.dart';

class InspectionDetailScreen extends StatefulWidget {
  const InspectionDetailScreen({super.key});

  @override
  State<InspectionDetailScreen> createState() => _InspectionDetailScreenState();
}

class _InspectionDetailScreenState extends State<InspectionDetailScreen> {
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<InspectionDetailsCubit, InspectionDetailsState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBarWidget(
            title: state.reference ?? '--',
          ),
          body: state.isLoading
              ? const CustomLoader()
              : state.inspectionDetails == null
                  ? const EmptyWidget(text: 'No details found')
                  : DefaultTabController(
                      length: 3,
                      child: Column(
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width,
                            margin: const EdgeInsets.all(16.0),
                            padding: const EdgeInsets.all(10.0),
                            decoration: BoxDecoration(
                              color: AppColors.white,
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            child: TabBar(
                              isScrollable: true,
                              dividerHeight: 0.0,
                              dividerColor: Colors.transparent,
                              indicatorPadding: EdgeInsets.zero,
                              tabAlignment: TabAlignment.center,
                              indicatorSize: TabBarIndicatorSize.tab,
                              indicatorColor: Colors.transparent,
                              labelPadding:
                                  const EdgeInsets.symmetric(horizontal: 4),
                              onTap: (index) {
                                setState(() {
                                  _selectedIndex = index;
                                });
                              },
                              tabs: [
                                TabBarItem(
                                  title: 'Details',
                                  isSelected: _selectedIndex == 0,
                                ),
                                TabBarItem(
                                  title: 'Logs',
                                  isSelected: _selectedIndex == 1,
                                ),
                                TabBarItem(
                                  title: 'Snags',
                                  isSelected: _selectedIndex == 2,
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: TabBarView(
                              children: [
                                InspectionDetailDetailsScreen(
                                  inspectionDetails: state.inspectionDetails,
                                ),
                                InspectionDetailLogsScreen(
                                  inspectionDetails: state.inspectionDetails,
                                ),
                                InspectionDetailSnagsScreen(
                                  snags: state.inspectionDetails?.snags,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
        );
      },
    );
  }
}
