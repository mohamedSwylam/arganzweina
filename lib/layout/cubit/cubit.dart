import 'package:arganzwina_app/layout/cubit/states.dart';
import 'package:arganzwina_app/model/categories_model.dart';
import 'package:arganzwina_app/model/change_favorites_model.dart';
import 'package:arganzwina_app/model/favorites_model.dart';
import 'package:arganzwina_app/model/home_model.dart';
import 'package:arganzwina_app/model/login_model.dart';
import 'package:arganzwina_app/modules/cart_screen/cart_screen.dart';
import 'package:arganzwina_app/modules/categories_screen/categories_screen.dart';
import 'package:arganzwina_app/modules/feeds_screen/feeds_screen.dart';
import 'package:arganzwina_app/modules/home_screen/home_screen.dart';
import 'package:arganzwina_app/modules/user_screen/user_screen.dart';
import 'package:arganzwina_app/shared/components/constants.dart';
import 'package:arganzwina_app/shared/network/local/cache_helper.dart';
import 'package:arganzwina_app/shared/network/remote/dio_helper.dart';
import 'package:arganzwina_app/shared/network/remote/end_point.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class StoreCubit extends Cubit<StoreStates> {
  StoreCubit() : super(StoreInitialState());

  static StoreCubit get(context) => BlocProvider.of(context);
  int currentIndex = 0;
  List<Widget> StoreScreens = [
    HomeScreen(),
    FeedsScreen(),
    CategoriesScreen(),
    CartScreen(),
    UserScreen(),
  ];
  bool isDark = false;

  void changeThemeMode({bool fromShared}) {
    if (fromShared != null) {
      isDark = fromShared;
      emit(StoreAppChangeThemeModeState());
    } else {
      isDark = !isDark;
      CacheHelper.putBoolean(key: 'isDark', value: isDark).then((value) {
        emit(StoreAppChangeThemeModeState());
      });
    }
  }


  void changeIndex(int index) {
    currentIndex = index;
    emit(StoreChangeBottomNavState());
  }
  String dropDownValue = '1';
  var items =  ['1','2','3','4','5','6'];
  void changeDropDownValue(String newValue){
    dropDownValue = newValue;
    emit(StoreChangeDropdownState());
  }

  HomeModel homeModel;
  Map<int, bool> favorite = {};

  void getHomeData() {
    emit(StoreLoadingHomeDataState());
    DioHelper.getData(
      url: HOME,
      token: token,
    ).then((value) {
      homeModel = HomeModel.fromJson(value.data);
      /*printFullText(homeModel.data.banners[0].image);
      print(homeModel.status);*/
      homeModel.data.products.forEach((element) {
        favorite.addAll({element.id: element.inFavorites});
      });
      print(favorite.toString());
      emit(StoreSuccessHomeDataState());
    }).catchError((error) {
      print(error.toString());
      emit(StoreErrorHomeDataState());
    });
  }

  CategoriesModel categoriesModel;

  void getCategoriesData() {
    DioHelper.getData(url: GET_CATEGORIES, token: token).then((value) {
      categoriesModel = CategoriesModel.fromJson(value.data);
      print(categoriesModel.status);
      emit(StoreSuccessCategoriesDataState());
    }).catchError((error) {
      print(error.toString());
      emit(StoreErrorCategoriesDataState());
    });
  }

  ChangeFavoritesModel changeFavoritesModel;

  void changeFavorite(int productId) {
    favorite[productId] = !favorite[productId];
    emit(StoreChangeFavoritesState());
    DioHelper.postData(
      url: FAVORITES,
      token: token,
      data: {
        'product_id': productId,
      },
    ).then((value) {
      changeFavoritesModel = ChangeFavoritesModel.fromJson(value.data);
      if (!changeFavoritesModel.status) {
        favorite[productId] = !favorite[productId];
      } else {
        getFavorites();
      }
      print(value.data);
      emit(StoreSuccessChangeFavoritesState(changeFavoritesModel));
    }).catchError((error) {
      emit(StoreErrorChangeFavoritesState());
    });
  }

  FavoritesModel favoritesModel;

  void getFavorites() {
    emit(StoreGetFavoritesLoadingState());
    DioHelper.getData(
      url: FAVORITES,
      token: token,
    ).then((value) {
      favoritesModel = FavoritesModel.fromJson(value.data);
      //printFullText(value.data.toString());

      emit(StoreGetFavoritesSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(StoreErrorGetFavoritesState());
    });
  }

  StoreLoginModel userLoginModel;

  void getUserData() {
    emit(StoreGetUserDataLoadingState());
    DioHelper.getData(
      url: PROFILE,
      token: token,
    ).then((value) {
      userLoginModel = StoreLoginModel.fromJson(value.data);
      //printFullText(value.data.toString());

      emit(StoreGetUserDataSuccessState(userLoginModel));
    }).catchError((error) {
      print(error.toString());
      emit(StoreErrorGetUserDataState());
    });
  }

  void updateUserData({
    @required String name,
    @required String email,
    @required String phone,
  }) {
    emit(StoreUpdateUserDataLoadingState());
    DioHelper.putData(url: UPDATE_PROFILE, token: token, data: {
      'name': name,
      'email': email,
      'phone': phone,
    }).then((value) {
      userLoginModel = StoreLoginModel.fromJson(value.data);
      //printFullText(value.data.toString());

      emit(StoreUpdateUserDataSuccessState(userLoginModel));
    }).catchError((error) {
      print(error.toString());
      emit(StoreErrorUpdateUserDataState());
    });
  }
}
