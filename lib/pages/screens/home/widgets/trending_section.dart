import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:web_portfolio/models/product_model.dart';
import 'package:web_portfolio/pages/base/product_widget.dart';
import 'package:web_portfolio/pages/screens/home/widgets/home_slider_display.dart';
import 'package:web_portfolio/utils/constants.dart';
import 'package:web_portfolio/utils/screen_helper.dart';

class TrendingProductsSection extends StatelessWidget {
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
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
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
            style: TextStyle(
                fontFamily: "DancingScript",
                color: Color(0xffc01157),
                fontSize: 22),
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
            child: CarouselSlider(
              options: CarouselOptions(
                enlargeCenterPage: true,
                autoPlay: true,
                viewportFraction: 0.3,
                scrollPhysics: NeverScrollableScrollPhysics(),
                //   enableInfiniteScroll: true,
                //autoPlayCurve: Curves.fastOutSlowIn,
                scrollDirection: Axis.horizontal,
                //height: carouselContainerHeight,
              ),,
              items: productList
                  .map(
                    ((product) => ProductWidget(productModel: product)),
                  )
                  .toList(),
            ),
          ),
          // Container(
          //   child: LayoutBuilder(
          //     builder: (_context, constraints) {
          //       return ResponsiveGridView.builder(
          //         padding: EdgeInsets.all(0.0),
          //         shrinkWrap: true,
          //         physics: NeverScrollableScrollPhysics(),
          //         alignment: Alignment.topCenter,
          //         gridDelegate: ResponsiveGridDelegate(
          //           mainAxisSpacing: 20.0,
          //           crossAxisSpacing: 20.0,
          //           maxCrossAxisExtent: ScreenHelper.isTablet(context) ||
          //                   ScreenHelper.isMobile(context)
          //               ? constraints.maxWidth / 2.0
          //               : 250.0,
          //           // Hack to adjust child height
          //           childAspectRatio: ScreenHelper.isDesktop(context)
          //               ? 1
          //               : MediaQuery.of(context).size.aspectRatio * 1.5,
          //         ),
          //         itemBuilder: (BuildContext context, int index) {
          //           return Container(
          //             child: Column(
          //               crossAxisAlignment: CrossAxisAlignment.start,
          //               children: [
          //                 Row(
          //                   mainAxisAlignment: MainAxisAlignment.start,
          //                   children: [
          //                     Image.asset(
          //                       productList[index].imagePath,
          //                       width: 40.0,
          //                     ),
          //                     SizedBox(
          //                       width: 15.0,
          //                     ),
          //                     Text(
          //                       productList[index].description,
          //                       style: GoogleFonts.oswald(
          //                         fontSize: 20.0,
          //                         fontWeight: FontWeight.w700,
          //                         color: Colors.white,
          //                       ),
          //                     )
          //                   ],
          //                 ),
          //                 SizedBox(
          //                   height: 15.0,
          //                 ),
          //                 Text(
          //                   productList[index].price,
          //                   style: TextStyle(
          //                     color: kCaptionColor,
          //                     height: 1.5,
          //                     fontSize: 14.0,
          //                   ),
          //                 )
          //               ],
          //             ),
          //           );
          //         },
          //         itemCount: productList.length,
          //       );
          //     },
          //   ),
          // )
        ],
      ),
    );
  }
}
