import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:web_portfolio/data/models/drawer_tile_model.dart';
import 'package:web_portfolio/utils/color_palette.dart';
import 'package:web_portfolio/utils/dimensions.dart';
import 'package:web_portfolio/utils/font_styles.dart';

class DrawerTile extends StatelessWidget {
  final DrawerTileModel? drawerTileModel;


  DrawerTile({@required this.drawerTileModel, });

  @override
  Widget build(BuildContext context) {


    return InkWell(
      onTap: drawerTileModel!.onPressed,
      child: Container(
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(
              color: Palette.grey_3,
            ),
          ),
        ),
        height: 60,
        width: double.infinity,
        padding: EdgeInsets.symmetric(
          horizontal: Dimensions.PADDING_SIZE_SMALL,
        ),
        child: Row(
          children: <Widget>[
            Icon(drawerTileModel!.iconData),
            SizedBox(width: 15),
            Text(
              drawerTileModel!.title!,
              style: karlaRegular13,
            ),
          ],
        ),
      ),
    );
  }
}
