import 'package:arganzwina_app/layout/cubit/cubit.dart';
import 'package:arganzwina_app/layout/cubit/states.dart';
import 'package:arganzwina_app/modules/product_screen/product_details.dart';
import 'package:arganzwina_app/shared/components/components.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_icons/flutter_icons.dart';


class FeedsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<StoreCubit,StoreStates>(
      listener: (context,state){},
      builder: (context,state){
        return Scaffold(
          appBar: AppBar(
            toolbarHeight: 65,
            elevation: 0,
            backgroundColor: Colors.transparent,
            leading: GestureDetector(
              onTap: () {},
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Icon(Feather.shopping_cart),
              ),
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 12),
                child: Text(
                  'جميع المنتجات',
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
                ),
            ],
          ),
          body: Container(
            child: GridView.builder(
              shrinkWrap: true,
              itemCount: 10,
              physics: BouncingScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 0.0,
                crossAxisSpacing: 0.0,
                childAspectRatio: 0.6,
              ),
              itemBuilder: (context, index) {
                return buildfeedsItem(context,);
              },
            ),
          ),
        );
      },
    );
  }
}
Widget buildfeedsItem(context,)=>InkWell(
  onTap: (){
    navigateTo(context, ProductDetails());
  },
  child:   Container(
    margin: EdgeInsets.all(15.0),
    clipBehavior: Clip.antiAliasWithSaveLayer,
    decoration: BoxDecoration(
      color:Colors.white,
      border: Border.all(color: Colors.grey),
      borderRadius: BorderRadius.circular(20.0),
      boxShadow: [
        BoxShadow(
          color: Color(0xff37475A).withOpacity(0.2),
          blurRadius: 20.0,
          offset: const Offset(0, 10),
        )
      ],
    ),

    child: Column(

      mainAxisAlignment: MainAxisAlignment.spaceEvenly,

      children: [

        Expanded(

          child: Image(

            fit: BoxFit.fill,

            height: 180,

            image:NetworkImage('https://arganzwina.com/Files/Photos/0b04c3ff-8b9b-4eaa-8093-7490fc808f86_02d6d9dff5b023c2496076a49e0a381c.jpg'),

            width: double.infinity,

          ),

        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 5,),
            Text(
              'قناع الطمي المغربي', style: TextStyle(
              color: Colors.teal,
              fontWeight: FontWeight.bold,
              fontSize: 13,
            ),
              textAlign: TextAlign.center,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            SizedBox(height: 5,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '460 ر.س',
                  style: TextStyle(
                    fontSize: 13.0,
                    color: Colors.teal,
                    decoration: TextDecoration.lineThrough,
                  ),
                ),
                SizedBox(width: 5,),
                Text(
                  '360 ر.س',
                  style: TextStyle(
                    fontSize: 13.0,
                    color: Colors.red,
                  ),
                ),
              ],
            ),
            SizedBox(height: 5,),
            Container(
              color: Colors.teal,
              width: double.infinity,
              height: 40,
              child: Center(
                child: Text(
                  'اضف الي السله',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 13,
                  ),
                  textAlign: TextAlign.center,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
          ],
        ),
      ],

    ),

  ),
);