import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iskaan_inspections_mobile/bloc/communities/communities_cubit.dart';
import 'package:iskaan_inspections_mobile/bloc/inspection/inspection_cubit.dart';
import 'package:iskaan_inspections_mobile/bloc/snags/snags_cubit.dart';
import 'package:iskaan_inspections_mobile/res/constants/constants.dart';

part 'main_dashboard_state.dart';

class MainDashboardCubit extends Cubit<MainDashboardState> {
  MainDashboardCubit() : super(const MainDashboardState());

  void onChangeSelectedIndex(BuildContext context, int? index) {
    if (index == AppConstants.inspectionIndex) {
      context.read<InspectionCubit>().getInspections();
    } else if (index == AppConstants.snagsIndex) {
      context.read<SnagsCubit>().getSnags();
    } else if (index == AppConstants.communitiesIndex) {
      context.read<CommunitiesCubit>().getCommunities();
    }

    emit(state.copyWith(selectedIndex: index));
  }
}
