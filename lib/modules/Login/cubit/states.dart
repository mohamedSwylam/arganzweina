

import 'package:arganzwina_app/model/login_model.dart';

abstract class StoreLoginStates {}

class StoreLoginInitialState extends StoreLoginStates {}

class StoreLoginLoadingState extends StoreLoginStates {}

class StoreLoginSuccessState extends StoreLoginStates {
  final StoreLoginModel loginModel;

  StoreLoginSuccessState(this.loginModel);
}

class StoreLoginErrorState extends StoreLoginStates {
  final String error;

  StoreLoginErrorState(this.error);
}

class StoreLoginPasswordVisibilityState extends StoreLoginStates {}
