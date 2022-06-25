import 'package:flutter/material.dart';
import 'package:web_portfolio/utils/font_styles.dart';
import 'package:web_portfolio/utils/screen_helper.dart';

class TransparentDivider extends StatelessWidget {
  const TransparentDivider({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      alignment: Alignment.center,
      decoration: ScreenHelper.isDesktop(context)
          ? null
          : BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/background.jpg'),
              fit: BoxFit.cover)),
      child: Text(
        'SHOP FENTY',
        style: rosarivo36.copyWith(color: Colors.white),
      ),
      height: 200,
    );
  }
}