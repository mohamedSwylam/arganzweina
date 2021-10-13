import 'package:arganzwina_app/modules/search/search_screen.dart';
import 'package:arganzwina_app/shared/components/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:titled_navigation_bar/titled_navigation_bar.dart';
import 'cubit/cubit.dart';
import 'cubit/states.dart';

class StoreLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<StoreCubit, StoreStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = StoreCubit.get(context);
        return Scaffold(
          body: cubit.StoreScreens[cubit.currentIndex],
          bottomNavigationBar: TitledBottomNavigationBar(
            onTap: (index) => cubit.changeIndex(index),
            currentIndex: cubit.currentIndex,
            items: [
              TitledNavigationBarItem(title: Text('الرئيسه'), icon: Feather.home,),
              TitledNavigationBarItem(title: Text('المنتجات'), icon: Feather.rss,),
              TitledNavigationBarItem(title: Text('الاصناف'), icon: Feather.grid,),
              TitledNavigationBarItem(title: Text('العربه'), icon: Feather.shopping_cart,),
              TitledNavigationBarItem(title: Text('الحساب'), icon: Feather.user,),
            ],
          ),
        );
      },
    );
  }
}
