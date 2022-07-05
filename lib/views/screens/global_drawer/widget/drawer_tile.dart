import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:web_portfolio/data/models/drawer_header_item.dart';
import 'package:web_portfolio/utils/color_palette.dart';
import 'package:web_portfolio/utils/dimensions.dart';
import 'package:web_portfolio/utils/font_styles.dart';

class DrawerTile extends StatelessWidget {
  final DrawerHeaderItem? drawerHeaderItem;
  DrawerTile({
    @required this.drawerHeaderItem,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: drawerHeaderItem!.onTap,
      child: Container(
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(
              color: Palette.pink,
            ),
          ),
        ),
        height: 60,
        // width: double.infinity,
        padding: EdgeInsets.symmetric(
          horizontal: Dimensions.PADDING_SIZE_SMALL,
        ),
        child: Row(
          children: <Widget>[
            Icon(drawerHeaderItem!.iconData),
            SizedBox(width: 15),
            Text(
              drawerHeaderItem!.title!,
              style: karlaRegular13.copyWith(color: Palette.white),
            ),
          ],
        ),
      ),
    );
  }
}
