import 'package:flutter/material.dart';
import 'package:iskaan_inspections_mobile/res/constants/app_colors.dart';
import 'package:iskaan_inspections_mobile/view/screens/communities/detail/community_detail_inspections_screen.dart';
import 'package:iskaan_inspections_mobile/view/screens/communities/detail/community_detail_snags_screen.dart';
import 'package:iskaan_inspections_mobile/view/screens/communities/detail/community_detail_statistics_screen.dart';
import 'package:iskaan_inspections_mobile/view/widgets/app_bar/appbar_widget.dart';
import 'package:iskaan_inspections_mobile/view/widgets/tab_bar/tab_bar_item.dart';

class CommunityDetailScreen extends StatefulWidget {
  const CommunityDetailScreen({super.key});

  @override
  State<CommunityDetailScreen> createState() => _CommunityDetailScreenState();
}

class _CommunityDetailScreenState extends State<CommunityDetailScreen> {
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    Map<String,dynamic> arguments =ModalRoute.of(context)?.settings.arguments as Map<String,dynamic>;
    return Scaffold(
      appBar:  AppBarWidget(
        title: arguments['name'],
      ),
      body: DefaultTabController(
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
                labelPadding: const EdgeInsets.symmetric(horizontal: 4),
                onTap: (index) {
                  setState(() {
                    _selectedIndex=index;
                  });
                },
                tabs: [
                  TabBarItem(
                    title: 'Statistics',
                    isSelected: _selectedIndex == 0,
                  ),
                  TabBarItem(
                    title: 'Inspections',
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
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  CommunityDetailStatisticsScreen(),
                  const CommunityDetailInspectionsScreen(),
                  const CommunityDetailSnagsScreen(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
