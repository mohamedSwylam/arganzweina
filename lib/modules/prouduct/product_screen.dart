import 'package:arganzwina_app/layout/cubit/cubit.dart';
import 'package:arganzwina_app/layout/cubit/states.dart';
import 'package:arganzwina_app/model/categories_model.dart';
import 'package:arganzwina_app/model/home_model.dart';
import 'package:arganzwina_app/shared/components/components.dart';
import 'package:arganzwina_app/shared/styles/color.dart';
import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:carousel_slider/carousel_slider.dart';


class ProductScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<StoreCubit, StoreStates>(
      listener: (context, state) {
          },
      builder: (context, state) {
        return Center(child: Text('product'));
      },
    );
  }
}
