import 'package:flutter_bloc/flutter_bloc.dart';

part 'snag_detail_state.dart';
class SnagDetailCubit extends Cubit<SnagDetailState> {
  SnagDetailCubit() : super(const SnagDetailState());


  onChangeCarouselIndex(int index){
    emit(state.copyWith(carouselIndex: index));
  }

  // Future<void> getSnagDetails({required int id}) async {
  //   emit(state.copyWith(isLoading: true));
  //   InspectionDetailsResponseModel? response =
  //   await _inspectionRepo.getInspectionDetails(id: id).onError(
  //         (error, stackTrace) {
  //       emit(state.copyWith(isLoading: false));
  //       Fluttertoast.showToast(
  //         msg: error.toString(),
  //       );
  //       throw error!;
  //     },
  //   );
  //   emit(state.copyWith(isLoading: false));
  //   if (response != null) {
  //     emit(state.copyWith(inspectionDetails: response.record));
  //   } else {
  //     Fluttertoast.showToast(
  //         msg: 'Something went wrong while fetching inspection details');
  //   }
  // }

}
