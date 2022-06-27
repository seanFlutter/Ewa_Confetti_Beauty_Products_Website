import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:web_portfolio/pages/screens/home/widgets/divider_section.dart';
import 'package:web_portfolio/pages/screens/home/widgets/home_slider_display.dart';
import 'package:web_portfolio/pages/screens/home/widgets/trending_section.dart';
import 'package:web_portfolio/pages/screens/home/widgets/testimonials_section.dart';
import 'package:web_portfolio/pages/screens/home/widgets/footer.dart';
import 'package:web_portfolio/pages/screens/home/widgets/header.dart';
import 'package:web_portfolio/pages/screens/home/widgets/about_us_section.dart';
import 'package:web_portfolio/pages/screens/home/widgets/portfolio_stats.dart';
import 'package:web_portfolio/pages/screens/home/widgets/contact_us_section.dart';
import 'package:web_portfolio/pages/screens/home/widgets/brands_section.dart';

import 'package:web_portfolio/pages/screens/home/widgets/new_arrivals_section.dart';
import 'package:web_portfolio/utils/constants.dart';
import 'package:web_portfolio/utils/font_styles.dart';
import 'package:web_portfolio/utils/globals.dart';
import 'package:web_portfolio/utils/screen_helper.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      key: Globals.scaffoldKey,
      endDrawer: Drawer(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 16.0,
              vertical: 24.0,
            ),
            child: ListView.separated(
              itemBuilder: (BuildContext context, int index) {
                return headerItems[index].isButton
                    ? MouseRegion(
                        cursor: SystemMouseCursors.click,
                        child: Container(
                          decoration: BoxDecoration(
                            color: kDangerColor,
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          padding: EdgeInsets.symmetric(horizontal: 28.0),
                          child: TextButton(
                            onPressed: headerItems[index].onTap,
                            child: Text(
                              headerItems[index].title!,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14.0,
                              ),
                            ),
                          ),
                        ),
                      )
                    : ListTile(
                        title: Text(
                          headerItems[index].title!,
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      );
              },
              separatorBuilder: (BuildContext context, int index) {
                return SizedBox(
                  height: 10.0,
                );
              },
              itemCount: headerItems.length,
            ),
          ),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/background.jpg'),
                fit: BoxFit.cover)),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Header(),
              HomeSliderDisplay(),
              TrendingProductsSection(),
              AboutUsSection(),
              TransparentDivider(),
              NewArrivalsSection(),
              TestimonialSection(),  BrandsSection(),
              ContactUsSection(),

              Footer(),
            ],
          ),
        ),
      ),
    );
  }
}
