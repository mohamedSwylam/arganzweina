import 'package:arganzwina_app/layout/cubit/cubit.dart';
import 'package:arganzwina_app/layout/cubit/states.dart';
import 'package:arganzwina_app/shared/components/components.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
class ProductDetails extends StatelessWidget {

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
              onTap: () {
                Navigator.pop(context);
              },
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Icon(Feather.arrow_left),
              ),
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 12),
                child: Text(
                  'تفاصيل المنتج',
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
          body: Stack(
            children: [
              Container(
                foregroundDecoration: BoxDecoration(color: Colors.black12,),
                width: double.infinity,
                height: MediaQuery.of(context).size.height*0.38,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(
                        'https://arganzwina.com/files/photos/d47dd8c8-4461-434a-a552-824862e8a84b_download.jpg'),
                  ),
                ),
              ),
              SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.only(top: 240.0,bottom: 20.0,),
                  child: Column(
                    children: [
                      Container(
                        color: Theme.of(context).scaffoldBackgroundColor,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 15.0),
                              child: Text(
                                'غاسول مغربي بودره',
                                style: Theme.of(context).textTheme.bodyText1.copyWith(fontSize: 25,fontWeight: FontWeight.bold),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 15.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text(
                                    '460 ر.س',
                                    style: TextStyle(
                                      fontSize: 18.0,
                                      color: Colors.teal,
                                      decoration: TextDecoration.lineThrough,
                                    ),
                                  ),
                                  SizedBox(width: 5,),
                                  Text(
                                    '360 ر.س',
                                    style: TextStyle(
                                      fontSize: 18.0,
                                      color: Colors.red,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 10,),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 15.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    height: 160,
                                    width: 150,
                                    decoration: BoxDecoration(
                                      color: Colors.teal,
                                      borderRadius: BorderRadius.circular(17),
                                    ),
                                    child: Column(
                                      children: [
                                        Text(
                                          'الكميه ',
                                          style: Theme.of(context).textTheme.bodyText1,
                                        ),
                                        SizedBox(height: 10,),
                                        Container(
                                          width: MediaQuery.of(context).size.width * 0.35,
                                          height: MediaQuery.of(context).size.height * 0.07,
                                          clipBehavior: Clip.antiAliasWithSaveLayer,
                                          decoration: BoxDecoration(
                                            color: Colors.grey[300],
                                          borderRadius: BorderRadius.circular(17),
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.only(top:10.0),
                                            child: DropdownButton(
                                              value: StoreCubit.get(context).dropDownValue,
                                              icon: Icon(Icons.keyboard_arrow_down),
                                              isExpanded: true,
                                              isDense: true,
                                              items:StoreCubit.get(context).items.map((String items) {
                                                return DropdownMenuItem(
                                                    value: items,
                                                    child: Center(child: Text(items,)),
                                                );
                                              }
                                              ).toList(),
                                              onChanged: (newValue) => StoreCubit.get(context).changeDropDownValue(newValue),
                                            ),
                                          ),
                                        ),
                                        SizedBox(height: 10,),
                                        Container(
                                          width: MediaQuery.of(context).size.width * 0.35,
                                          height: MediaQuery.of(context).size.height * 0.07,
                                          child: RaisedButton(
                                            onPressed: () {},
                                            shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(17),
                                              side: BorderSide(color: Colors.grey[300]),
                                            ),
                                            color: Colors.grey[300],
                                            child: Text(
                                              'اضافه للسله',
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                color: Colors.teal,
                                                fontSize: 15,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(width:40,),
                                  Text(
                                    'الكميه ',
                                    style: Theme.of(context).textTheme.bodyText1,
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 10,),
                            myDivider(),
                            SizedBox(height: 10,),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 15.0),
                              child: Text(
                                ' وصف  المنتج',
                                maxLines: 4,
                                textAlign: TextAlign.end,
                                style: TextStyle(
                                  color: Colors.grey,
                                ),
                              ),
                            ),
                            SizedBox(height: 10,),
                            myDivider(),
                            SizedBox(height: 10,),
                            Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      SizedBox(height: 10,),
                                      Text(
                                        '0 %', style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 13,
                                      ),
                                        textAlign: TextAlign.center,
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      SizedBox(height: 18),
                                      Text(
                                        '0 %', style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 13,
                                      ),
                                        textAlign: TextAlign.center,
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      SizedBox(height: 16),
                                      Text(
                                        '0 %', style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 13,
                                      ),
                                        textAlign: TextAlign.center,
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      SizedBox(height: 17),
                                      Text(
                                        '0 %', style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 13,
                                      ),
                                        textAlign: TextAlign.center,
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      SizedBox(height: 16),
                                      Text(
                                        '0 %', style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 13,
                                      ),
                                        textAlign: TextAlign.center,
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ],
                                  ),
                                  SizedBox(width: 10,),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      SizedBox(height: 15,),
                                      Container(
                                        width: 160,
                                        height:15.0,
                                        decoration: BoxDecoration(
                                          color: Colors.grey[300],
                                          borderRadius: BorderRadius.circular(6),
                                        ),
                                      ),
                                      SizedBox(height: 25),
                                      Container(
                                        width: 160,
                                        height:15.0,
                                        decoration: BoxDecoration(
                                          color: Colors.grey[300],
                                          borderRadius: BorderRadius.circular(6),
                                        ),
                                      ),
                                      SizedBox(height: 26),
                                      Container(
                                        width: 160,
                                        height:15.0,
                                        decoration: BoxDecoration(
                                          color: Colors.grey[300],
                                          borderRadius: BorderRadius.circular(6),
                                        ),
                                      ),
                                      SizedBox(height: 28),
                                      Container(
                                        width: 160,
                                        height:15.0,
                                        decoration: BoxDecoration(
                                          color: Colors.grey[300],
                                          borderRadius: BorderRadius.circular(6),
                                        ),
                                      ),
                                      SizedBox(height: 25),
                                      Container(
                                        width: 160,
                                        height:15.0,
                                        decoration: BoxDecoration(
                                          color: Colors.grey[300],
                                          borderRadius: BorderRadius.circular(6),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(width: 10,),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      SizedBox(height: 5,),
                                      Text(
                                        'رائع', style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 13,
                                      ),
                                        textAlign: TextAlign.center,
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      SizedBox(height: 20),
                                      Text(
                                        'ممتاز', style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 13,
                                      ),
                                        textAlign: TextAlign.center,
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      SizedBox(height: 16),
                                      Text(
                                        'جيد', style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 13,
                                      ),
                                        textAlign: TextAlign.center,
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      SizedBox(height: 17),
                                      Text(
                                        'لم يعجبني', style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 13,
                                      ),
                                        textAlign: TextAlign.center,
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      SizedBox(height: 16),
                                      Text(
                                        'سئ', style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 13,
                                      ),
                                        textAlign: TextAlign.center,
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ],
                                  ),
                                  SizedBox(width: 10,),
                                  RatingBar.builder(
                                    initialRating: 3,
                                    minRating: 1,
                                    direction: Axis.vertical,
                                    allowHalfRating: true,
                                    itemCount: 5,
                                    itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                                    itemBuilder: (context, _) => Icon(
                                      Icons.star,
                                      color: Colors.teal,
                                    ),
                                    onRatingUpdate: (rating) {
                                      print(rating);
                                    },
                                  ),
                                ],
                              ),
                            ),
                            myDivider(),
                            Container(
                              color: Colors.white,
                              width: double.infinity,
                              height: 150,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  SizedBox(height: 10,),
                                  Text(
                                    'بدون تقييم حتي الان',
                                    textAlign: TextAlign.center,
                                    style: Theme.of(context).textTheme.bodyText1.copyWith(color: Colors.black),
                                  ),
                                  Text(
                                    'كن اول من يقيم',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 18,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            myDivider(),
                            SizedBox(height: 10,),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 15.0),
                              child: Text(
                                'قد يعجبك ايضا',
                                style:Theme.of(context).textTheme.bodyText1,),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 15.0),
                              child: Container(
                                height: 370,
                                child: ListView.separated(
                                  physics: BouncingScrollPhysics(),
                                  itemBuilder: (context, index) =>
                                      buildSuggestProduct(context),
                                  separatorBuilder: (context, index) => SizedBox(),
                                  itemCount: 10,
                                  scrollDirection: Axis.horizontal,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
Widget buildSuggestProduct(context)=>InkWell(
  onTap: (){
    navigateTo(context, ProductDetails());
  },
  child:   Container(
    width: 220,
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
