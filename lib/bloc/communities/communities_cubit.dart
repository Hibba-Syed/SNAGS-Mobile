import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:iskaan_inspections_mobile/model/association/association_model.dart';
import 'package:iskaan_inspections_mobile/model/association/associations_response_model.dart';
import 'package:iskaan_inspections_mobile/repo/association/association_repo.dart';
import 'package:iskaan_inspections_mobile/repo/association/association_repo_impl.dart';

part 'communities_state.dart';

class CommunitiesCubit extends Cubit<CommunitiesState> {
  CommunitiesCubit() : super(const CommunitiesState());
  final AssociationRepo _associationRepo = AssociationRepoImpl();

  Future<void> getCommunities() async {
    emit(state.copyWith(isLoading: true));
    AssociationsResponseModel? response =
        await _associationRepo.getAssociations().onError(
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
      emit(state.copyWith(communities: response.record));
    } else {
      Fluttertoast.showToast(
          msg: 'Something went wrong while fetching communities');
    }
  }

  Future<void> getMoreCommunities() async {
    int page = state.page + 1;
    emit(state.copyWith(loadMore: true,isLoading: false, page: page));
    AssociationsResponseModel? response = await _associationRepo
        .getAssociations(
      page: state.page,
    )
        .onError(
          (error, stackTrace) {
        emit(state.copyWith(loadMore: false));
        Fluttertoast.showToast(
          msg: error.toString(),
        );
        throw error!;
      },
    );
    emit(state.copyWith(loadMore: false));
    if (response != null) {
      if (response.record?.isNotEmpty ?? false) {
        List<Association> communities = state.communities ?? [];
        communities.addAll(response.record as Iterable<Association>);
        emit(state.copyWith(communities: communities));
      } else {
        Fluttertoast.showToast(msg: 'No more communities');
        page = state.page - 1;
        emit(state.copyWith(page: page));
      }
    } else {
      Fluttertoast.showToast(msg: 'Something went wrong while fetching communites');
    }
  }

}
