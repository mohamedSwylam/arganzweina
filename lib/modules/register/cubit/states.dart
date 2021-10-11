

import 'package:arganzwina_app/model/register_model.dart';

abstract class StoreRegisterStates {}

class StoreRegisterInitialState extends StoreRegisterStates {}

class StoreRegisterLoadingState extends StoreRegisterStates {}

class StoreRegisterSuccessState extends StoreRegisterStates {
  final StoreRegisterModel registerModel;

  StoreRegisterSuccessState(this.registerModel);
}

class StoreRegisterErrorState extends StoreRegisterStates {
  final String error;

  StoreRegisterErrorState(this.error);
}

class StoreRegisterPasswordVisibilityState extends StoreRegisterStates {}
