import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:web_portfolio/data/models/skill.dart';

import 'package:web_portfolio/utils/color_palette.dart';
import 'package:web_portfolio/utils/constants.dart';
import 'package:web_portfolio/utils/font_styles.dart';
import 'package:web_portfolio/utils/screen_helper.dart';

List<Skill> skills = [
  Skill(
    skill: "Dart",
    percentage: 62,
  ),
  Skill(
    skill: "Javascript",
    percentage: 80,
  ),
  Skill(
    skill: "PHP",
    percentage: 78,
  ),
  Skill(
    skill: "Python",
    percentage: 90,
  ),
  Skill(
    skill: "GoLang",
    percentage: 40,
  ),
];

class ContactUsSection extends StatefulWidget {
  @override
  State<ContactUsSection> createState() => _ContactUsSectionState();
}

class _ContactUsSectionState extends State<ContactUsSection> with TickerProviderStateMixin{
  // Create a controller
  late final AnimationController animationController = AnimationController(
    duration: const Duration(seconds: 10),
    vsync: this,
  )..repeat(reverse: false);

// Create an animation with value of type "double"
  late final Animation<double> animation = CurvedAnimation(
    parent: animationController,
    curve: Curves.linear,
  );
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: ScreenHelper(
        desktop: _buildUi(kDesktopMaxWidth),
        tablet: _buildUi(kTabletMaxWidth),
        mobile: _buildUi(getMobileMaxWidth(context)),
      ),
    );
  }

  Widget _buildUi(double width) {
    return Center(
      child: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          return ResponsiveWrapper(
            maxWidth: width,
            minWidth: width,
            child: Flex(
              direction: ScreenHelper.isMobile(context)
                  ? Axis.vertical
                  : Axis.horizontal,
              children: [
                Expanded(
                  flex: ScreenHelper.isMobile(context) ? 0 : 2,
                  child: Column(
                    children: <Widget>[
                      RotationTransition(turns: animation,
                        child: Image.asset(
                          "assets/images/logo.png",
                          width: 150.0,
                        ),
                      ),
                      Text(
                          'EWA CONFETTI is an online retail store providing the world’s best high end beauty products. From skin care to make up, each of the beauty products is chosen for its efficacy and stand-alone brilliance',
                          style: karla14grey),
                    ],
                  ),
                ),
                SizedBox(
                  width: 50.0,
                ),
                Expanded(
                  flex: ScreenHelper.isMobile(context) ? 0 : 4,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      _contactTile(Icons.location_on, 'Warri, Nigeria'),
                      _contactTile(Icons.phone, '+234 909 999 6421'),
                      _contactTile(Icons.email, 'EwaConfetti@outlook.com'),
                      SizedBox(
                        height: 20.0,
                      ),
              Divider(color: Palette.grey,),
                      SizedBox(height: 20),Text('NEWSLETTER', style:rosarivo16), SizedBox(height: 10),TextField(),
                    ],
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }

  Row _contactTile(IconData iconData, String info) {
    return Row(
      children: <Widget>[
        Icon(iconData),
        Text(
          info,
          style: karla14grey,
        )
      ],
    );
  }
}
