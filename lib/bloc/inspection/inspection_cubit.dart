import 'package:flutter_bloc/flutter_bloc.dart';

part 'inspection_state.dart';

class InspectionCubit extends Cubit<InspectionState> {
  InspectionCubit() : super(const InspectionState());
}
