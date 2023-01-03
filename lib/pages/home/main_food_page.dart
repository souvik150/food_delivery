import 'package:flutter/material.dart';
import 'package:food_delivery/utils/dimensions.dart';
import '../home/food_page_body.dart';
import '../../utils/colors.dart';
import '../../widgets/big_text.dart';
import '../../widgets/small_text.dart';

class MainFoodPage extends StatefulWidget {
  const MainFoodPage({Key? key}) : super(key: key);

  @override
  State<MainFoodPage> createState() => _MainFoodPageState();
}

class _MainFoodPageState extends State<MainFoodPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            child: Container(
              margin: const EdgeInsets.only(top: 45, bottom: 15),
              padding: EdgeInsets.only(
                  left: Dimension.width20, right: Dimension.width20),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(children: [
                      BigText(
                        text: "Arab Emirates",
                        color: AppColors.mainColor,
                      ),
                      Row(
                        children: [
                          SmallText(
                            text: "Dubai",
                            color: Colors.black54,
                          ),
                          Icon(Icons.arrow_drop_down_rounded),
                        ],
                      ),
                    ]),
                    Center(
                      child: Container(
                        height: Dimension.height45,
                        width: Dimension.height45,
                        child: Icon(Icons.search,
                            color: Colors.white, size: Dimension.iconSize24),
                        decoration: BoxDecoration(
                          color: AppColors.mainColor,
                          borderRadius:
                              BorderRadius.circular(Dimension.radius15),
                        ),
                      ),
                    )
                  ]),
            ),
          ),
          Expanded(
            child: SingleChildScrollView(child: FoodPageBody()),
          ),
        ],
      ),
    );
  }
}
