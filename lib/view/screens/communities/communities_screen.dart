import 'package:flutter/material.dart';
import 'package:iskaan_inspections_mobile/utils/routes/app_routes.dart';
import 'package:iskaan_inspections_mobile/view/helper/ui_helper.dart';
import 'package:iskaan_inspections_mobile/view/screens/communities/components/community_widget.dart';
import 'package:iskaan_inspections_mobile/view/widgets/textfield/search_text_field.dart';

class CommunitiesScreen extends StatelessWidget {
  const CommunitiesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0,vertical: 10.0),
          child: SearchTextField(),
        ),
        Expanded(
          child: ListView.separated(
            itemCount: 10,
            shrinkWrap: true,
            physics: const AlwaysScrollableScrollPhysics(),
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
            itemBuilder: (context, index) {
              return CommunityWidget(
                communityName: 'IT Plaza',
                communityOwnerName:
                    'HOAM - Highrise Owners Association Management',
                onTap: () {
                  Navigator.pushNamed(context, AppRoutes.communityDetail);
                },
              );
            },
            separatorBuilder: (context, index) {
              return UIHelper.verticalSpace(10.0);
            },
          ),
        ),
      ],
    );
  }
}
