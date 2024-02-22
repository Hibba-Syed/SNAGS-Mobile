import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iskaan_inspections_mobile/res/constants/constants.dart';

part 'main_dashboard_state.dart';

class MainDashboardCubit extends Cubit<MainDashboardState> {
  MainDashboardCubit() : super(const MainDashboardState());

  void onChangeSelectedIndex(int? index) {
    emit(state.copyWith(selectedIndex: index));
  }

}
