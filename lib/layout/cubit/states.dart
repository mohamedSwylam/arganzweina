

import 'package:arganzwina_app/model/change_favorites_model.dart';
import 'package:arganzwina_app/model/login_model.dart';

abstract class StoreStates {}

class StoreInitialState extends StoreStates {}

class StoreChangeBottomNavState extends StoreStates {}

class StoreChangeDropdownState extends StoreStates {}

class StoreLoadingHomeDataState extends StoreStates {}

class StoreSuccessHomeDataState extends StoreStates {}

class StoreErrorHomeDataState extends StoreStates {}

class StoreSuccessCategoriesDataState extends StoreStates {}

class StoreErrorCategoriesDataState extends StoreStates {}

class StoreSuccessChangeFavoritesState extends StoreStates {
  final ChangeFavoritesModel model;

  StoreSuccessChangeFavoritesState(this.model);
}

class StoreChangeFavoritesState extends StoreStates {}
class StoreAppChangeThemeModeState extends StoreStates {}

class StoreErrorChangeFavoritesState extends StoreStates {}

class StoreGetFavoritesLoadingState extends StoreStates {}

class StoreGetFavoritesSuccessState extends StoreStates {}

class StoreErrorGetFavoritesState extends StoreStates {}

class StoreGetUserDataLoadingState extends StoreStates {}

class StoreGetUserDataSuccessState extends StoreStates {
 final StoreLoginModel loginModel;

  StoreGetUserDataSuccessState(this.loginModel);
}

class StoreErrorGetUserDataState extends StoreStates {}
class StoreUpdateUserDataLoadingState extends StoreStates {}

class StoreUpdateUserDataSuccessState extends StoreStates {
  final StoreLoginModel loginModel;

  StoreUpdateUserDataSuccessState(this.loginModel);
}

class StoreErrorUpdateUserDataState extends StoreStates {}
