import 'package:flutter/material.dart';
import 'package:iskaan_inspections_mobile/res/constants/app_colors.dart';
import 'package:iskaan_inspections_mobile/res/styles/app_styles.dart';
import 'package:iskaan_inspections_mobile/view/screens/communities/detail/community_detail_inspections_screen.dart';
import 'package:iskaan_inspections_mobile/view/screens/communities/detail/community_detail_snags_screen.dart';
import 'package:iskaan_inspections_mobile/view/screens/communities/detail/community_detail_statistics_screen.dart';
import 'package:iskaan_inspections_mobile/view/screens/communities/detail/components/community_detail_tab_item.dart';
import 'package:iskaan_inspections_mobile/view/widgets/app_bar/appbar_widget.dart';

class CommunityDetailScreen extends StatefulWidget {
  const CommunityDetailScreen({super.key});

  @override
  State<CommunityDetailScreen> createState() => _CommunityDetailScreenState();
}

class _CommunityDetailScreenState extends State<CommunityDetailScreen> {
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWidget(
        title: 'IT Plaza',
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
                boxShadow: [
                  AppStyles.cardBoxShadow,
                ],
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
                  CommunityDetailTabItem(
                    title: 'Statistics',
                    isSelected: _selectedIndex == 0,
                  ),
                  CommunityDetailTabItem(
                    title: 'Inspections',
                    isSelected: _selectedIndex == 1,
                  ),
                  CommunityDetailTabItem(
                    title: 'Snags',
                    isSelected: _selectedIndex == 2,
                  ),
                ],
              ),
            ),
            const Expanded(
              child: TabBarView(
                children: [
                  CommunityDetailStatisticsScreen(),
                  CommunityDetailInspectionsScreen(),
                  CommunityDetailSnagsScreen(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
