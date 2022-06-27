import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:web_portfolio/models/header_item.dart';
import 'package:web_portfolio/utils/color_palette.dart';
import 'package:web_portfolio/utils/constants.dart';
import 'package:web_portfolio/utils/font_styles.dart';
import 'package:web_portfolio/utils/globals.dart';
import 'package:web_portfolio/utils/screen_helper.dart';

List<HeaderItem> headerItems = [
  HeaderItem(title: "ABOUT US", onTap: () {}),
  HeaderItem(title: "SHOP BY BRAND", onTap: () {}),
  HeaderItem(title: "MAKE UP", onTap: () {}),
  HeaderItem(title: "SKIN CARE", onTap: () {}),
  HeaderItem(title: "WELLNESS", onTap: () {}),
  HeaderItem(title: "FRAGRANCE", onTap: () {}),
];

class HeaderLogo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 40),
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: GestureDetector(
          onTap: () {},
          child: Image.asset(
            'assets/images/logo.png',
            height: 70,
          ),
        ),
      ),
    );
  }
}

class HeaderRow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ResponsiveVisibility(
      visible: false,
      visibleWhen: [
        Condition.largerThan(name: MOBILE),
      ],
      child: Row(
        children: headerItems
            .map(
              (item) => item.isButton
                  ? MouseRegion(
                      cursor: SystemMouseCursors.click,
                      child: Container(
                        decoration: BoxDecoration(
                          color: kDangerColor,
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        padding: EdgeInsets.symmetric(
                            horizontal: 20.0, vertical: 5.0),
                        child: TextButton(
                          onPressed: item.onTap,
                          child: Text(
                            item.title!,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 14.0,
                            ),
                          ),
                        ),
                      ),
                    )
                  : MouseRegion(
                      cursor: SystemMouseCursors.click,
                      child: Container(
                        margin: EdgeInsets.only(right: 30.0),
                        child: GestureDetector(
                          onTap: item.onTap,
                          child: Text(
                            item.title!,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 14.0,
                            ),
                          ),
                        ),
                      ),
                    ),
            )
            .toList(),
      ),
    );
  }
}

class Header extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: ScreenHelper(
        desktop: Padding(
          padding: EdgeInsets.symmetric(vertical: 8.0),
          child: buildHeader(),
        ),
        // We will make this in a bit
        mobile: buildMobileHeader(),
        tablet: buildHeader(),
      ),
    );
  }

  // mobile header
  Widget buildMobileHeader() {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: () {
                Globals.scaffoldKey.currentState!.openDrawer();
              },
              child: Row(
                children: [
                  Icon(
                    Icons.menu,
                  ),
                  Text('MENU')
                ],
              ),
            ),
            HeaderLogo(),
            Container(width:  200, color: Colors.green,
              child: Row(
                children: <Widget>[
                  Stack(
                    children: <Widget>[
                      Positioned(left: 0, right: 5, bottom: 0, top: 4, child: Icon(FeatherIcons.shoppingCart)),
                      Positioned(
                        right: 0,
                        top: 0,
                        child: Container(width: 10,height: 10,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: Palette.purple),
                          child: Text('2', style: karla13white),
                        ),
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  // Lets plan for mobile and smaller width screens
  Widget buildHeader() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          HeaderLogo(),
          HeaderRow(),
        ],
      ),
    );
  }
}
