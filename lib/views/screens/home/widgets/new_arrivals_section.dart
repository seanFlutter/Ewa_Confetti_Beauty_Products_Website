import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:responsive_framework/responsive_wrapper.dart';
import 'package:web_portfolio/views/base/product_widget.dart';
import 'package:web_portfolio/views/screens/home/widgets/trending_section.dart';
import 'package:web_portfolio/utils/constants.dart';
import 'package:web_portfolio/utils/font_styles.dart';
import 'package:web_portfolio/utils/screen_helper.dart';

class NewArrivalsSection extends StatelessWidget {
  // We can use same idea as about_us_section.dart and swap children order, let's copy code
  @override
  Widget build(BuildContext context) {
    return Container(color: Colors.white,
      child: ScreenHelper(
        desktop: _buildUi(kDesktopMaxWidth),
        tablet: _buildUi(kTabletMaxWidth),
        mobile: _buildUi(getMobileMaxWidth(context)),
      ),
    );
  }

  Widget _buildUi(double width) {
    return    Column(
      children: <Widget>[    SizedBox(height: 30),   Text(
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
          child: LayoutBuilder(
            builder: (  context, constraints) {
              return ResponsiveGridView.builder(
                padding: EdgeInsets.all(0.0),
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                alignment: Alignment.topCenter,
                gridDelegate: ResponsiveGridDelegate(
                  mainAxisSpacing: 20.0,
                  crossAxisSpacing: 20.0,
                  maxCrossAxisExtent: ScreenHelper.isTablet(context) ||
                      ScreenHelper.isMobile(context)
                      ? constraints.maxWidth / 2.0
                      : 250.0,
                  // Hack to adjust child height
                  childAspectRatio: ScreenHelper.isDesktop(context)
                      ? 1
                      : MediaQuery.of(context).size.aspectRatio * 1.5,
                ),
                itemBuilder: (BuildContext context, int index) {
                  return ProductWidget(productModel: productList[index],);
                },
                itemCount: productList.length,
              );
            },
          ),
        ),
      ],
    );
  }
}
