import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:web_portfolio/models/footer_item.dart';
import 'package:web_portfolio/utils/constants.dart';
import 'package:web_portfolio/utils/font_styles.dart';
import 'package:web_portfolio/utils/screen_helper.dart';



class Footer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ScreenHelper(
        desktop: _buildUi(kDesktopMaxWidth, context),
        tablet: _buildUi(kTabletMaxWidth, context),
        mobile: _buildUi(getMobileMaxWidth(context), context),
      ),
    );
  }
}

Widget _buildUi(double width, BuildContext context) {
  return Center(
    child: ResponsiveWrapper(
      maxWidth: width,
      minWidth: width,
      defaultScale: false,
      child: LayoutBuilder(
        builder: (context, constraints) {
          return    RichText(
            text: TextSpan(
              text: 'ALL RIGHTS RESERVED \u00a9',
              style: karla14grey.copyWith(fontWeight: FontWeight.bold),
              children:  <TextSpan>[
                  TextSpan(text: ' 2020. Shiela Beauty World. Built by', style: karla14grey),
                  TextSpan(text: 'OneClickMedia', style: karla14),

              ],
            ),
          );
        },
      ),
    ),
  );
}
