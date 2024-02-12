import 'package:flutter_bloc/flutter_bloc.dart';

part 'main_dashboard_state.dart';

class MainDashboardCubit extends Cubit<MainDashboardState> {
  MainDashboardCubit() : super(const MainDashboardState());


  void onChangeSelectedIndex(int? index) {
    emit(state.copyWith(selectedIndex: index));
  }




}
