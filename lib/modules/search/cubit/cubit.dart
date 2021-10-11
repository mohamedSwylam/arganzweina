
import 'package:arganzwina_app/model/search_model.dart';
import 'package:arganzwina_app/modules/search/cubit/states.dart';
import 'package:arganzwina_app/shared/components/constants.dart';
import 'package:arganzwina_app/shared/network/remote/dio_helper.dart';
import 'package:arganzwina_app/shared/network/remote/end_point.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class StoreSearchCubit extends Cubit<StoreSearchStates> {
  StoreSearchCubit() : super(SearchInitialState());

  static StoreSearchCubit get(context) => BlocProvider.of(context);
  SearchModel searchModel;

  void searchProduct({String text}) {
    emit(SearchLoadingState());
    DioHelper.postData(
      url: SEARCH_PRODUCT,
      token: token,
      data: {
        'text': text,
      },
    ).then((value) {
      searchModel = SearchModel.fromJson(value.data);
      emit(SearchSuccessState());
    }).catchError((error) {
      emit(SearchErrorState());
    });
  }
}
