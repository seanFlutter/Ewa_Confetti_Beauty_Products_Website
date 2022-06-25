import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:web_portfolio/models/product_model.dart';
import 'package:web_portfolio/pages/base/product_widget.dart';
import 'package:web_portfolio/pages/screens/home/widgets/home_slider_display.dart';
import 'package:web_portfolio/utils/constants.dart';
import 'package:web_portfolio/utils/font_styles.dart';
import 'package:web_portfolio/utils/screen_helper.dart';

final List<ProductModel> productList = [
  ProductModel(
    description: "Goodnight glow Retin-ALT sleeping creme",
    imagePath: "assets/images/product1.png",
    price: "119,000",
  ),
  ProductModel(
    description: "Has A Gun “Vanilla vibes” EDP 100ml For Wome",
    imagePath: "assets/images/product2.png",
    price: "84,000",
  ),
  ProductModel(
    description: "Ewa confetti blemish control face lave",
    imagePath: "assets/images/product3.png",
    price: "73,000",
  ),
  ProductModel(
    description: "Good Molecules Niacinamide Brightening Toner",
    imagePath: "assets/images/product4.png",
    price: "50,000",
  ),
  ProductModel(
    description: "Night touch, shadow monkey ",
    imagePath: "assets/images/product5.png",
    price: "250,000",
  ),
  ProductModel(
    description: "Beauty Overdose",
    imagePath: "assets/images/product6.png",
    price: "187,500",
  ),  ProductModel(
    description: "Marlians Forever",
    imagePath: "assets/images/product7.png",
    price: "187,500",
  ),  ProductModel(
    description: "Raving Stylish",
    imagePath: "assets/images/product8.png",
    price: "13,500",
  ),  ProductModel(
    description: "Super Cute Midnight Vibes",
    imagePath: "assets/images/product9.png",
    price: "187,500",
  ),  ProductModel(
    description: "Sexy Smashing Kill Them All",
    imagePath: "assets/images/product10.png",
    price: "87,500",
  ),
];

class TrendingProductsSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      width: double.infinity,
      child: ScreenHelper(
        desktop: _buildUi(context, kDesktopMaxWidth),
        tablet: _buildUi(context, kTabletMaxWidth),
        mobile: _buildUi(context, getMobileMaxWidth(context)),
      ),
    );
  }

  Widget _buildUi(BuildContext context, double width) {
    // we need the context to get maxWidth before the constraints below
    return ResponsiveWrapper(
      maxWidth: width,
      minWidth: width,
      defaultScale: false,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          SizedBox(height: 40),
          Text(
            'Top Picks For You',
            style: dancingScriptRegular22,
          ),
          SizedBox(
            height: 20.0,
          ),
          Text(
            'Trending Products',
            style: TextStyle(
                fontFamily: "DancingScript", color: Colors.black, fontSize: 36),
          ),
          Container(
            // color: Colors.red,
            margin: EdgeInsets.only(top: 15),
            child: CarouselSlider(
              options: CarouselOptions(
                disableCenter: true,
                height: 400,
                // enlargeCenterPage: true,
                autoPlay: true,
                viewportFraction: ScreenHelper.isDesktop(context) ? 0.2 : 0.3,
                scrollPhysics: NeverScrollableScrollPhysics(),
                //   enableInfiniteScroll: true,
                //autoPlayCurve: Curves.fastOutSlowIn,
                scrollDirection: Axis.horizontal,
                //height: carouselContainerHeight,
              ),
              items: productList
                  .map(
                    ((product) => ProductWidget(productModel: product)),
                  )
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }
}
