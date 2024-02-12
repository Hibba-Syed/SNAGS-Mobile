import 'package:flutter_bloc/flutter_bloc.dart';

part 'communities_state.dart';

class CommunitiesCubit extends Cubit<CommunitiesState> {
  CommunitiesCubit() : super(const CommunitiesState());
}
