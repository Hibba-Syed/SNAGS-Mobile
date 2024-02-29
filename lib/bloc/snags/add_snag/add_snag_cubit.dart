import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:iskaan_inspections_mobile/model/association/association_model.dart';
import 'package:iskaan_inspections_mobile/model/snag/add_snag_response_model.dart';
import 'package:iskaan_inspections_mobile/repo/snag/snag_repo.dart';
import 'package:iskaan_inspections_mobile/repo/snag/snag_repo_impl.dart';
import 'package:http/http.dart' as http;

part 'add_snag_state.dart';

class AddSnagCubit extends Cubit<AddSnagState> {
  AddSnagCubit() : super(const AddSnagState());

  final SnagRepo _snagRepo = SnagRepoImpl();

  Future<void> addSnag(BuildContext context,
      {required Map<String, dynamic> data,
      required List<String> filesPaths}) async {
    emit(state.copyWith(
      isLoading: true,
    ));
    try {
      List<http.MultipartFile> multipartFiles = [];
      for (int i=0; i<filesPaths.length;i++) {
        multipartFiles
            .add(await http.MultipartFile.fromPath('images[$i][file]', filesPaths[i]));
      }
      AddSnagResponseModel? response = await _snagRepo
          .addSnag(
        data: data,
        files: multipartFiles,
      )
          .onError(
        (error, stackTrace) {
          emit(state.copyWith(isLoading: false));
          Fluttertoast.showToast(
            msg: error.toString(),
          );
          throw error!;
        },
      );
      emit(state.copyWith(isLoading: false));
      if (response != null) {
        Navigator.pop(context, response.record);
      } else {
        Fluttertoast.showToast(msg: 'Something went wrong while adding snag');
      }
    } catch (e) {
      emit(state.copyWith(isLoading: false));
      Fluttertoast.showToast(msg: e.toString());
      rethrow;
    }
  }
}
