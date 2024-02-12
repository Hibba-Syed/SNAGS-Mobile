import 'package:flutter_bloc/flutter_bloc.dart';

part 'snags_state.dart';

class SnagsCubit extends Cubit<SnagsState> {
  SnagsCubit() : super(const SnagsState());
}
