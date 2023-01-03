import 'package:flutter/material.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:food_delivery/widgets/app_column.dart';

import '../../utils/colors.dart';
import '../../widgets/big_text.dart';
import '../../widgets/icon_and_text_widget.dart';
import '../../widgets/small_text.dart';
import '../../utils/dimensions.dart';

class FoodPageBody extends StatefulWidget {
  const FoodPageBody({Key? key}) : super(key: key);

  @override
  State<FoodPageBody> createState() => _FoodPageBodyState();
}

class _FoodPageBodyState extends State<FoodPageBody> {
  //To show left and right stuff
  PageController pageController = PageController(viewportFraction: 0.85);
  var _currPageValue = 0.0;
  double _scaleFactor = 0.8;
  double _height = Dimension.pageViewContainer;

  @override
  void initState() {
    super.initState();
    pageController.addListener(() {
      setState(() {
        _currPageValue = pageController.page!;
      });
    });
  }

  @override
  void dispose() {
    pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: Dimension.pageView,
          child: PageView.builder(
            itemCount: 5,
            itemBuilder: (context, position) {
              return Container(
                  child: PageView.builder(
                      controller: pageController,
                      itemCount: 5,
                      itemBuilder: (context, position) {
                        return _buildPageItem(position);
                      }));
            },
          ),
        ),
        DotsIndicator(
          dotsCount: 5,
          position: _currPageValue,
          decorator: DotsDecorator(
            activeColor: AppColors.mainColor,
            size: const Size.square(9.0),
            activeSize: const Size(18.0, 9.0),
            activeShape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
          ),
        ),
        SizedBox(
          height: Dimension.height30,
        ),
        Container(
          margin: EdgeInsets.only(left: Dimension.width30),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              BigText(text: "Popular"),
              SizedBox(
                width: Dimension.width10,
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 3),
                child: BigText(text: ".", color: Colors.black26),
              ),
              SizedBox(
                width: Dimension.width10,
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 2),
                child: SmallText(text: "Food Pairing"),
              ),
            ],
          ),
        ),
        ListView.builder(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: 10,
          itemBuilder: (context, index) {
            return Container(
              margin: EdgeInsets.only(
                  left: Dimension.width20,
                  right: Dimension.width20,
                  bottom: Dimension.height10),
              child: Row(
                children: [
                  Container(
                    width: Dimension.listViewImgSize,
                    height: Dimension.listViewImgSize,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(Dimension.radius20),
                      color: Colors.white38,
                      image: const DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage('assets/image/food0.png'),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      height: Dimension.listViewTextContSize,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(Dimension.radius20),
                          bottomRight: Radius.circular(Dimension.radius20),
                        ),
                        color: Colors.white,
                      ),
                      child: Padding(
                        padding: EdgeInsets.only(
                            left: Dimension.width10, right: Dimension.width10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            BigText(text: "Nutritous Fruit meal in Dubai"),
                            SizedBox(
                              height: Dimension.height10,
                            ),
                            SmallText(text: "With dubai characteristics"),
                            SizedBox(
                              height: Dimension.height10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                IconAndTextWidget(
                                  icon: Icons.circle_sharp,
                                  text: "Normal",
                                  iconColor: AppColors.iconColor1,
                                ),
                                IconAndTextWidget(
                                  icon: Icons.location_on,
                                  text: "1.7km",
                                  iconColor: AppColors.mainColor,
                                ),
                                IconAndTextWidget(
                                  icon: Icons.access_time_rounded,
                                  text: "32min",
                                  iconColor: AppColors.iconColor2,
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ],
    );
  }

  //TO give a container width inside a stack container you pust wrap it woth stack widget.

  Widget _buildPageItem(int index) {
    Matrix4 matrix = new Matrix4.identity();
    if (index == _currPageValue.floor()) {
      var currScale = 1 - (_currPageValue - index) * (1 - _scaleFactor);
      var currTrans = _height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else if (index == _currPageValue.floor() + 1) {
      var currScale =
          _scaleFactor + (_currPageValue - index + 1) * (1 - _scaleFactor);
      var currTrans = _height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else if (index == _currPageValue.floor() - 1) {
      var currScale = 1 - (_currPageValue - index) * (1 - _scaleFactor);
      var currTrans = _height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1);
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else {
      var currScale = 0.8;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, _height * (1 - _scaleFactor) / 2, 1);
    }

    return Transform(
      transform: matrix,
      child: Stack(
        children: [
          Container(
            height: Dimension.pageViewContainer,
            margin: EdgeInsets.only(
                left: Dimension.width10, right: Dimension.width10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(Dimension.radius30),
              color: index.isEven
                  ? const Color(0xFFf69c5f)
                  : const Color(0xFF9294CC),
              image: const DecorationImage(
                image: AssetImage("assets/image/food0.png"),
                fit: BoxFit.cover,
                scale: 1.5,
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: Dimension.pageViewTextContainer,
              margin: EdgeInsets.only(
                  left: Dimension.width30,
                  right: Dimension.width30,
                  bottom: Dimension.width30),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimension.radius20),
                color: Colors.white,
                boxShadow: const [
                  BoxShadow(
                    color: Color(0xFFe8e8e8),
                    blurRadius: 5.0,
                    offset: Offset(0, 5),
                  ),
                  BoxShadow(
                    color: Color(0xFFe8e8e8),
                    blurRadius: 5.0,
                    offset: Offset(-5, 0),
                  ),
                  BoxShadow(
                    color: Color(0xFFe8e8e8),
                    blurRadius: 5.0,
                    offset: Offset(5, 0),
                  )
                ],
              ),
              child: Container(
                padding: EdgeInsets.only(
                    left: Dimension.height15,
                    right: Dimension.height15,
                    top: Dimension.height15),
                child: AppColumn(text: "Chinese Side Dish"),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
