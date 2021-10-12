import 'package:flutter/material.dart';
class CategoryWidget extends StatelessWidget {
  final int index;
  CategoryWidget({Key key, this.index}) : super(key: key);
  List <Map<String,Object>> categories= [
   {
      'categoryName':'البان طبيعيه',
      'categoryImage':'https://arganzwina.com/files/photos/0b04c3ff-8b9b-4eaa-8093-7490fc808f86_02d6d9dff5b023c2496076a49e0a381c.jpg',
    },
    {
      'categoryName':'ماسك الطمي',
      'categoryImage':'https://arganzwina.com/files/photos/2de4b9d8-e4df-44db-bd6c-6602b0a54387_%D9%85%D8%A7%D8%B3%D9%83-%D8%A7%D9%84%D8%B7%D9%8A%D9%86-%D8%A7%D9%84%D9%85%D8%BA%D8%B1%D8%A8%D9%8A-%D8%A7%D9%8A-%D9%87%D9%8A%D8%B1%D8%A8.jpg',
    },
    {
      'categoryName':'الطين المغربي',
      'categoryImage':'https://arganzwina.com/files/photos/134b38c0-e3f8-40e1-9a60-ecfcd47219a4_%D9%85%D8%A7%D8%B3%D9%83-%D8%A7%D9%84%D8%B7%D9%8A%D9%86-%D8%A7%D9%84%D9%85%D8%BA%D8%B1%D8%A8%D9%8A-%D8%A7%D9%8A-%D9%87%D9%8A%D8%B1%D8%A8.jpg',
    },
    {
      'categoryName':'الغاسول المغربي',
      'categoryImage':'https://arganzwina.com/files/photos/af970cae-8a59-4e02-8437-84780d7b915a_%D8%A7%D9%84%D8%BA%D8%A7%D8%B3%D9%88%D9%84-%D8%A7%D9%84%D9%85%D8%BA%D8%B1%D8%A8%D9%8A.jpg',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.circular(20.0),
        boxShadow: [
          BoxShadow(
            color: Color(0xff37475A).withOpacity(0.2),
            blurRadius: 20.0,
            offset: const Offset(0, 10),
          )
        ],
      ),
      child:   Stack(
        alignment: AlignmentDirectional.bottomCenter,
        children: [
          Image(
            image: NetworkImage(categories[index]['categoryImage']),
            height: 150,
            width: 150,
            fit: BoxFit.cover,
          ),
          Container(
              height: 30,
              width: 150,
              color: Colors.black.withOpacity(0.8),
              child: Text(
                categories[index]['categoryName'],
                textAlign: TextAlign.center,
                maxLines: 1,
                style: TextStyle(fontSize: 16, color: Colors.white,fontWeight: FontWeight.bold),
              )),
        ],
      ),
    );
  }
}
