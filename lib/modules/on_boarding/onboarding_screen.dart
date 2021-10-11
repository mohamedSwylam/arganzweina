import 'package:arganzwina_app/modules/Login/shop_login_screen.dart';
import 'package:arganzwina_app/shared/components/components.dart';
import 'package:arganzwina_app/shared/network/local/cache_helper.dart';
import 'package:flutter/material.dart';

import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class BoardingModel {
  String image;
  String title;
  String body;

  BoardingModel(
      {@required this.image, @required this.title, @required this.body});
}

class OnBoardingScreen extends StatefulWidget {
  @override
  _OnBoardingScreenState createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  var boardController = PageController();

  List<BoardingModel> boarding = [
    BoardingModel(
      image: 'assets/images/onboard1.png',
      title: 'تسوق العديد من المنتجات',
      body: 'اختر منتجك المفضل لدينا العديد من المنتجات والاصناف',
    ),
    BoardingModel(
      image: 'assets/images/onboard2.png',
      title: 'اختر طريقه الدفع المناسبه',
      body: 'لدينا العديد من العروض لك وطرق دفع مختلفه',
    ),
    BoardingModel(
      image: 'assets/images/onboard3.png',
      title: 'خدمه التوصيل ',
      body: 'خدمه التوصيل متوفره في اي مكان وفي اسرع وقت',
    ),
  ];

  bool isLast = false;

  void submit() {
    CacheHelper.saveData(key: 'onBoarding', value: true).then((value) {
      if (value) {
        navigateAndFinish(
          context,
          StoreLoginScreen(),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          defaultTextButton(submit, 'Skip'),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                onPageChanged: (index) {
                  if (index == boarding.length - 1) {
                    print('last');
                    setState(() {
                      isLast = true;
                    });
                  } else {
                    print('not last');
                    setState(() {
                      isLast = false;
                    });
                  }
                },
                physics: BouncingScrollPhysics(),
                controller: boardController,
                itemBuilder: (context, index) {
                  return buildBoardingItem(boarding[index]);
                },
                itemCount: boarding.length,
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Row(
              children: [
                SmoothPageIndicator(
                  controller: boardController,
                  count: boarding.length,
                  effect: ExpandingDotsEffect(
                    dotColor: Colors.grey,
                    activeDotColor: Colors.teal,
                    dotHeight: 10,
                    dotWidth: 10,
                    spacing: 5.0,
                    expansionFactor: 4,
                  ),
                ),
                Spacer(),
                FloatingActionButton(
                  onPressed: () {
                    if (isLast == true) {
                      submit();
                    } else {
                      boardController.nextPage(
                          duration: Duration(milliseconds: 750),
                          curve: Curves.fastLinearToSlowEaseIn);
                    }
                  },
                  child: Icon(Icons.arrow_forward_ios),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget buildBoardingItem(BoardingModel model) => Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Expanded(
              child: Image(
            image: AssetImage('${model.image}'),
          )),
          SizedBox(
            height: 30,
          ),
          Text(
            '${model.title}',
            textAlign: TextAlign.end,
            style: TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Text(
            '${model.body}',
            textAlign: TextAlign.end,
            style: TextStyle(
              fontSize: 14.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 14,
          ),
        ],
      );
}
