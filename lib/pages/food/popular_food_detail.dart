import 'package:flutter/material.dart';
import 'package:food_delivery/utils/dimensions.dart';
import 'package:food_delivery/widgets/app_column.dart';
import 'package:food_delivery/widgets/app_icon.dart';

import '../../utils/colors.dart';
import '../../widgets/big_text.dart';
import '../../widgets/icon_and_text_widget.dart';
import '../../widgets/small_text.dart';

class PopularFoodDetails extends StatelessWidget {
  const PopularFoodDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Positioned(
          left: 0,
          right: 0,
          child: Container(
            width: double.maxFinite,
            height: Dimension.popluarFoodImgSize,
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage("assets/image/food0.png"),
              ),
            ),
          ),
        ),
        Positioned(
            top: Dimension.height45,
            left: Dimension.width20,
            right: Dimension.width20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppIcon(icon: Icons.arrow_back_ios),
                AppIcon(icon: Icons.shopping_cart_outlined)
              ],
            )),
        Positioned(
          left: 0,
          right: 0,
          bottom: 0,
          top: Dimension.popluarFoodImgSize - 20,
          child: Container(
            padding: EdgeInsets.only(
                left: Dimension.width20,
                right: Dimension.width20,
                top: Dimension.height20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(Dimension.radius20),
                topLeft: Radius.circular(Dimension.radius20),
              ),
              color: Colors.white,
            ),
            child: Column(
              children: [
                AppColumn(text: "Chinese Side Dish"),
                BigText(text: "Introduce")
              ],
            ),
          ),
        ),
      ],
    ));
  }
}
