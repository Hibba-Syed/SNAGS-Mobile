import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:iskaan_inspections_mobile/model/snag/add_edit_snag_response_model.dart';
import 'package:iskaan_inspections_mobile/repo/snag/snag_repo.dart';
import 'package:iskaan_inspections_mobile/repo/snag/snag_repo_impl.dart';
import 'package:http/http.dart' as http;
import 'package:iskaan_inspections_mobile/view/screens/snags/edit_snag_screen.dart';

part 'add_edit_snag_state.dart';

class AddEditSnagCubit extends Cubit<AddEditSnagState> {
  AddEditSnagCubit() : super(const AddEditSnagState());

  final SnagRepo _snagRepo = SnagRepoImpl();

  Future<void> addSnag(
    BuildContext context, {
    required Map<String, dynamic> data,
    required List<String> filesPaths,
  }) async {
    emit(state.copyWith(
      isLoading: true,
    ));
    try {
      List<http.MultipartFile> multipartFiles = [];
      for (int i = 0; i < filesPaths.length; i++) {
        if (filesPaths[i].isNotEmpty) {
          multipartFiles.add(await http.MultipartFile.fromPath(
              'images[$i][file]', filesPaths[i]));
        }
      }
      AddEditSnagResponseModel? response = await _snagRepo
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

  Future<void> updateSnag(
    BuildContext context, {
    required int id,
    required Map<String, dynamic> data,
    required List<EditSnagImageModel> images,
  }) async {
    emit(state.copyWith(
      isLoading: true,
    ));
    try {
      List<http.MultipartFile> multipartFiles = [];
      for (int i = 0; i < images.length; i++) {
        if (images[i].id != null) {
          data['images[$i][id]'] = images[i].id;
        }

        if (images[i].filePath?.isNotEmpty ?? false) {
          multipartFiles.add(
            await http.MultipartFile.fromPath(
              'images[$i][file]',
              images[i].filePath!,
            ),
          );
        }
      }
      print('data:: $data');
      print('multi length:: ${multipartFiles.length}');
      // print('multi length:: ${multipartFiles.first.field}');
      AddEditSnagResponseModel? response = await _snagRepo
          .updateSnag(
        id: id,
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
