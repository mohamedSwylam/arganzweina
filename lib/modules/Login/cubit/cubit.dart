import 'package:arganzwina_app/model/login_model.dart';
import 'package:arganzwina_app/modules/Login/cubit/states.dart';
import 'package:arganzwina_app/shared/network/remote/dio_helper.dart';
import 'package:arganzwina_app/shared/network/remote/end_point.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';


class StoreLoginCubit extends Cubit<StoreLoginStates> {
  StoreLoginCubit() : super(StoreLoginInitialState());

  static StoreLoginCubit get(context) => BlocProvider.of(context);
  StoreLoginModel loginModel ;
  void userLogin({
  @required String email,
  @required String password,
}) {
    emit(StoreLoginLoadingState());
    DioHelper.postData(
      url: LOGIN,
      data: {
        'email':email,
        'password':password,
      },
    ).then((value) {
      print(value.data);
      loginModel = StoreLoginModel.fromJson(value.data);
      emit(StoreLoginSuccessState(loginModel));
    }).catchError((error){
      print(error.toString());
      emit(StoreLoginErrorState(error.toString()));
    });
  }
  IconData suffix= Icons.visibility_outlined;
  bool isPasswordShown=true;
  void changePasswordVisibility(){
    isPasswordShown = !isPasswordShown;
    suffix= isPasswordShown ? Icons.visibility_outlined : Icons.visibility_off_outlined;
    emit(StoreLoginPasswordVisibilityState());
  }
}
