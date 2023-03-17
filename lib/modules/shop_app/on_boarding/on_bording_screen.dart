import 'package:demo_1/modules/shop_app/login/login_screen.dart';
import 'package:demo_1/shared/components/components.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../shared/network/local/cache_helper.dart';
import '../../../shared/styles/colors.dart';

class BoardingMudel {
  String image;
  String title;
  String body;

  BoardingMudel({
    required this.image,
    required this.title,
    required this.body,
  });
}

class onBoardingScreen extends StatelessWidget {
  var boardController = PageController();

  List<BoardingMudel> boarding = [
    BoardingMudel(
        image: 'assets/images/onboard_1.jpg',
        title: 'Text Title 1',
        body: 'Text body 1'),
    BoardingMudel(
        image: 'assets/images/onboard_1.jpg',
        title: 'Text Title 2',
        body: 'Text body 2'),
    BoardingMudel(
        image: 'assets/images/onboard_1.jpg',
        title: 'Text Title 3',
        body: 'Text body 3'),
  ];

  bool islast = false;

  void onSubmit(context) {
    CacheHelper.saveData(key: 'onBoarding', value: true).then((value) {
      if(value == true)
      goToScreenAndFinish(
        context,
        ShopLoginScreen(),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          TextButton(
              onPressed: () {
                onSubmit(context);
              },
              child: Text(
                'SKIP',
                style: TextStyle(
                  fontSize: 20,
                ),
              ))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                itemBuilder: (context, index) =>
                    onBoardingItemBuilder(boarding[index]),
                itemCount: boarding.length,
                physics: BouncingScrollPhysics(),
                controller: boardController,
                onPageChanged: (index) {
                  if (index == boarding.length - 1) {
                    islast = true;
                    print('is');
                  } else {
                    islast = false;
                    print('not');
                  }
                },
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
                  effect: WormEffect(
                    activeDotColor: defultColor,
                    dotWidth: 30,
                    spacing: 10,
                  ),
                ),
                Spacer(),
                FloatingActionButton(
                  backgroundColor: defultColor,
                  onPressed: () {
                    if (islast) {
                      onSubmit(context);
                    } else {
                      boardController.nextPage(
                        duration: Duration(
                          milliseconds: 500,
                        ),
                        curve: Curves.fastLinearToSlowEaseIn,
                      );
                    }
                  },
                  child: Icon(Icons.arrow_forward_ios),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget onBoardingItemBuilder(BoardingMudel mudel) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(child: Image(image: AssetImage('${mudel.image}'))),
          SizedBox(
            height: 30,
          ),
          Text(
            '${mudel.title}',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 25,
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Text(
            '${mudel.body}',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 15,
            ),
          ),
        ],
      );
}
