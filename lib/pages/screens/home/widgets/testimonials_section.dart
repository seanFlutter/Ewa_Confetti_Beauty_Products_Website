import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:web_portfolio/models/product_model.dart';
import 'package:web_portfolio/models/testimonial_model.dart';
import 'package:web_portfolio/pages/base/product_widget.dart';
import 'package:web_portfolio/pages/screens/home/widgets/home_slider_display.dart';
import 'package:web_portfolio/utils/constants.dart';
import 'package:web_portfolio/utils/font_styles.dart';
import 'package:web_portfolio/utils/screen_helper.dart';

final List<Testimonial> testimonialList = [
  Testimonial(
      message:
          "In love. I\’ve been a fan of Ewa Confetti  for years ever since I first heard of their products on Instagram. I cannot say enough good things about it 😍 Ewa Confetti is possibly the only line of products that hasn’t left my skin irritated but has instead left me feeling soft, relaxed and smelling heavenly.",
      occupation: '',
      personName: "Chinelo A",
      profilePhoto: ''),
  Testimonial(
      message:
          "Ewa Confetti's products are really unparalleled in quality and creativity. Plus I always want to support black business (esp. black womens businesses) and the amount of work she puts into the store is seriously incredible. But I mean even without any of the ethical reasons I support Ewa, her products (like I said) are insanely good",
      occupation: '',
      personName: "Catherine W",
      profilePhoto: ''),
  Testimonial(
      message:
          "I have used various bath bombs for my aches and pains (as a martial artist these are a must-have) for several years, but just recently found the facial products. I am mixed race and have had difficulty finding non-drying / non-greasy products that work for me. These are the best !!! I especially love the mischief mask. And EwaConfetti is an A+ lady who I feel happy to support in any way possible.",
      occupation: '',
      personName: "Amaka D",
      profilePhoto: ''),
];

class TestimonialSection extends StatefulWidget {
  @override
  State<TestimonialSection> createState() => _TrendingProductsSectionState();
}

class _TrendingProductsSectionState extends State<TestimonialSection>
    with TickerProviderStateMixin {


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
        mainAxisAlignment: MainAxisAlignment.start,crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          SizedBox(height: 40),

          Text(
            'Client Reviews',
            style: TextStyle(
                fontFamily: "DancingScript", color: Colors.black, fontSize: 36),
          ),
          SizedBox(height: 10),
          // Image.asset(
          //   'assets/images/logo.png',
          //   height: 100,
          // ),
          Container(
            // color: Colors.red,
            margin: EdgeInsets.only(top: 15),
            child: CarouselSlider(
              options: CarouselOptions(
                height: 200,
                // enlargeCenterPage: true,
                autoPlay: true,
                viewportFraction: 1,
                scrollPhysics: NeverScrollableScrollPhysics(),
                //   enableInfiniteScroll: true,
                //autoPlayCurve: Curves.fastOutSlowIn,
                scrollDirection: Axis.horizontal,
                //height: carouselContainerHeight,
              ),
              items: testimonialList
                  .map(
                    ((testimonial) => Column(
                          children: <Widget>[
                            Text('${testimonial.message}', style: karla14grey),
                        SizedBox(height: 20),
                        RichText(
                        text: TextSpan(
                          text: '${testimonial.personName} ',
                          style: karla14,
                          children:  <TextSpan>[
                            TextSpan(text: '- Happy Client ', style: karla14grey),

                          ],
                        ),
                            )
                          ],
                        )),
                  )
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }
}
