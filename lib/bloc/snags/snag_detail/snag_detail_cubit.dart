import 'package:flutter_bloc/flutter_bloc.dart';

part 'snag_detail_state.dart';
class SnagDetailCubit extends Cubit<SnagDetailState> {
  SnagDetailCubit() : super(const SnagDetailState());


  onChangeCarouselIndex(int index){
    emit(state.copyWith(carouselIndex: index));
  }
}
