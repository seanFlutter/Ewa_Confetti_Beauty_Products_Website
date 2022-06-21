import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:web_portfolio/models/carousel_item_model.dart';
import 'package:web_portfolio/pages/screens/home/widgets/carousel_items.dart';
import 'package:web_portfolio/utils/constants.dart';
import 'package:web_portfolio/utils/screen_helper.dart';

class HomeSliderDisplay extends StatelessWidget {
  final CarouselController carouselController = CarouselController();

  List<HomeDisplayModel> homeDisplayImages = List.generate(
    2,
        (index) =>
        HomeDisplayModel(
      text: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "PRODUCT DESIGNER",
              style:
              GoogleFonts.oswald(
                color: kPrimaryColor,
                fontWeight: FontWeight.w900,
                fontSize: 16.0,
              ),
            ),
            SizedBox(
              height: 18.0,
            ),
            Text(
              "MICHELE\nHARRINGTON",
              style: GoogleFonts.oswald(
                color: Colors.white,
                fontSize: 40.0,
                fontWeight: FontWeight.w900,
                height: 1.3,
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            Text(
              "Full-stack developer, based in Barcelona",
              style: TextStyle(
                color: kCaptionColor,
                fontSize: 15.0,
                height: 1.0,
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            Container(
              child: Wrap(
                children: [
                  Text(
                    "Need a full custom website?",
                    style: TextStyle(
                      color: kCaptionColor,
                      fontSize: 15.0,
                      height: 1.5,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: MouseRegion(
                      cursor: SystemMouseCursors.click,
                      child: Text(
                        " Got a project? Let's talk.",
                        style: TextStyle(
                          height: 1.5,
                          color: Colors.white,
                          fontSize: 15.0,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 25.0,
            ),
            MouseRegion(
              cursor: SystemMouseCursors.click,
              child: Container(
                decoration: BoxDecoration(
                  color: kPrimaryColor,
                  borderRadius: BorderRadius.circular(8.0),
                ),
                height: 48.0,
                padding: EdgeInsets.symmetric(
                  horizontal: 28.0,
                ),
                child: TextButton(
                  onPressed: () {},
                  child: Text(
                    "GET STARTED",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 13.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
      image: Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
        child: Image.asset(
          "assets/images/backdrop${index + 1}.png",
          fit: BoxFit.cover,
        ),
      ),
    ),
  );
  @override
  Widget build(BuildContext context) {
    double carouselContainerHeight = MediaQuery.of(context).size.height *
        (ScreenHelper.isMobile(context) ? .7 : .85);
    return Container(width: double.infinity,
      alignment: Alignment.center,
      child: CarouselSlider(
        carouselController: carouselController,
        options: CarouselOptions(
           autoPlay: true,
          viewportFraction: 1,
          scrollPhysics: NeverScrollableScrollPhysics(),
          //height: carouselContainerHeight,
        ),
        items: List.generate(
          homeDisplayImages.length,
          (index) => Builder(
            builder: (BuildContext context) {
              return ScreenHelper(
                // Responsive views
                desktop: _buildDesktop(
                  context,

                  homeDisplayImages[index].image,
                ),
                tablet: _buildTablet(
                  context,

                  homeDisplayImages[index].image,
                ),
                mobile: _buildMobile(
                  context,

                  homeDisplayImages[index].image,
                ),
              );
            },
          ),
        ).toList(),
      ),
    );
  }
}

// Big screens
Widget _buildDesktop(BuildContext context,  Widget image) {
  return Center(
    child: ResponsiveWrapper(
      maxWidth: kDesktopMaxWidth,
      minWidth: kDesktopMaxWidth,
      defaultScale: false,
      child: Expanded(
        child: image,
      ),
    ),
  );
}

// Mid screens
Widget _buildTablet(BuildContext context, Widget image) {
  return Center(
    child: ResponsiveWrapper(
      maxWidth: kTabletMaxWidth,
      minWidth: kTabletMaxWidth,
      defaultScale: false,
      child: Expanded(
        child: image,
      ),
    ),
  );
}

// SMall Screens

Widget _buildMobile(BuildContext context, Widget image) {
  return Container(
    constraints: BoxConstraints(
      maxWidth: getMobileMaxWidth(context),
    ),
    width: double.infinity,
    child: image,
  );
}
