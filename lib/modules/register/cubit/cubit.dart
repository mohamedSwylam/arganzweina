import 'package:arganzwina_app/model/register_model.dart';
import 'package:arganzwina_app/modules/register/cubit/states.dart';
import 'package:arganzwina_app/shared/network/remote/dio_helper.dart';
import 'package:arganzwina_app/shared/network/remote/end_point.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class StoreRegisterCubit extends Cubit<StoreRegisterStates> {
  StoreRegisterCubit() : super(StoreRegisterInitialState());

  static StoreRegisterCubit get(context) => BlocProvider.of(context);
  StoreRegisterModel registerModel;

  void userRegister({
    @required String email,
    @required String password,
    @required String name,
    @required String phone,
  }) {
    emit(StoreRegisterLoadingState());
    DioHelper.postData(
      url: REGISTER,
      data: {
        'name' : name,
        'phone' : phone,
        'email': email,
        'password': password,

      },
    ).then((value) {
      print(value.data);
      registerModel = StoreRegisterModel.fromJson(value.data);
      emit(StoreRegisterSuccessState(registerModel));
    }).catchError((error) {
      print(error.toString());
      emit(StoreRegisterErrorState(error.toString()));
    });
  }

  IconData suffix = Icons.visibility_outlined;
  bool isPasswordShown = true;

  void changePasswordVisibility() {
    isPasswordShown = !isPasswordShown;
    suffix = isPasswordShown
        ? Icons.visibility_outlined
        : Icons.visibility_off_outlined;
    emit(StoreRegisterPasswordVisibilityState());
  }
}
