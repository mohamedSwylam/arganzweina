import 'package:arganzwina_app/layout/cubit/cubit.dart';
import 'package:arganzwina_app/layout/cubit/states.dart';
import 'package:arganzwina_app/model/categories_model.dart';
import 'package:arganzwina_app/model/home_model.dart';
import 'package:arganzwina_app/shared/components/components.dart';
import 'package:arganzwina_app/shared/styles/color.dart';
import 'package:arganzwina_app/shared/styles/icon_broken.dart';
import 'package:arganzwina_app/shared/styles/styles.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_icons/flutter_icons.dart';

import 'category.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<StoreCubit, StoreStates>(
      listener: (context, state) {},
      builder: (context, state) {
        Size size = MediaQuery.of(context).size;
        return Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: KWhiteColor,
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.transparent,
            leading: GestureDetector(
              onTap: () {},
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Icon(Feather.menu),
              ),
            ),
            centerTitle: true,
            title: Container(
              width: 80,
              height: 50,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/icon.png'),
                ),
              ),
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: GestureDetector(
                  onTap: () {},
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Icon(Feather.shopping_bag),
                  ),
                ),
              ),
            ],
          ),
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                SizedBox(height: 20,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40.0,vertical: 20),
                  child: Container(
                    child: TextFormField(
                      textAlign: TextAlign.end,
                      onTap: (){},
                      cursorHeight: 20,
                      decoration: InputDecoration(
                        hintText: "ابحث في المتجر",
                        fillColor: Colors.grey[300],
                        prefixIcon: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Icon(Feather.search),
                          ),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16.0),
                          borderSide: BorderSide.none,
                        ),
                        filled: true,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20,),
                Container(
                  height: 140.0,
                  width: double.infinity,
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 30),
                  child: Carousel(
                    boxFit: BoxFit.cover,
                    autoplay: true,
                    animationCurve: Curves.fastOutSlowIn,
                    animationDuration: Duration(milliseconds: 1000),
                    dotSize: 5.0,
                    dotIncreasedColor: Colors.teal,
                    dotPosition: DotPosition.bottomCenter,
                    dotVerticalPadding: 0.0,
                    showIndicator: true,
                    borderRadius: true,
                    radius: Radius.circular(20),
                    indicatorBgPadding: 7.0,
                    images: [
                      NetworkImage('https://arganzwina.com/Files/Photos/5dfca52d-f798-45d6-b4e3-be7e2568d14d_Ghassoul-Chorfa-Akhdar-3-1000x1000.png'),
                      NetworkImage('https://arganzwina.com/Files/Photos/d47dd8c8-4461-434a-a552-824862e8a84b_download.jpg'),
                      NetworkImage('https://arganzwina.com/Files/Photos/0b04c3ff-8b9b-4eaa-8093-7490fc808f86_02d6d9dff5b023c2496076a49e0a381c.jpg'),
                    ],
                  ),
                ),
                SizedBox(height: 20,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0,),
                  child: Text(
                    'جميع الاصناف',
                    style:Theme.of(context).textTheme.headline6.copyWith(fontWeight: FontWeight.bold),),),
                SizedBox(height: 15,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: Container(
                    height: 150,
                    child: ListView.separated(
                      physics: BouncingScrollPhysics(),
                      itemBuilder: (context, index) =>
                          CategoryWidget(index: index,),
                      separatorBuilder: (context, index) => SizedBox(
                        width: 10,
                      ),
                      itemCount: 4,
                      scrollDirection: Axis.horizontal,
                    ),
                  ),
                ),

              ],
            ),
          ),
        );
      },
    );
  }
}
