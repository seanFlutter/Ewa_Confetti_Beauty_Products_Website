import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:web_portfolio/views/screens/global_drawer/global_drawer.dart';
import 'package:web_portfolio/views/screens/home/widgets/divider_section.dart';
import 'package:web_portfolio/views/screens/home/widgets/home_slider_display.dart';
import 'package:web_portfolio/views/screens/home/widgets/trending_section.dart';
import 'package:web_portfolio/views/screens/home/widgets/testimonials_section.dart';
import 'package:web_portfolio/views/screens/home/widgets/footer.dart';
import 'package:web_portfolio/views/screens/home/widgets/header.dart';
import 'package:web_portfolio/views/screens/home/widgets/about_us_section.dart';
import 'package:web_portfolio/views/screens/home/widgets/portfolio_stats.dart';
import 'package:web_portfolio/views/screens/home/widgets/contact_us_section.dart';
import 'package:web_portfolio/views/screens/home/widgets/brands_section.dart';

import 'package:web_portfolio/views/screens/home/widgets/new_arrivals_section.dart';
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
      drawer: GlobalDrawer(),
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
              TestimonialSection(),
              BrandsSection(),
              ContactUsSection(),
              Footer(),
            ],
          ),
        ),
      ),
    );
  }
}
