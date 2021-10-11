import 'package:arganzwina_app/layout/cubit/cubit.dart';
import 'package:arganzwina_app/layout/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<StoreCubit, StoreStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return Center(child: Text('sittings'));
        });
  }
}