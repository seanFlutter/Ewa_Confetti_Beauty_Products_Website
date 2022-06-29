import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:web_portfolio/data/models/menu_model.dart';
import 'package:web_portfolio/utils/color_palette.dart';
import 'package:web_portfolio/utils/dimensions.dart';
import 'package:web_portfolio/utils/font_styles.dart';

class MenuButton extends StatelessWidget {
  final DrawerTileModel? drawerTileModel;
  final bool? isProfile;
  final bool? isLogout;
  MenuButton(
      {@required this.drawerTileModel,
      @required this.isProfile,
      @required this.isLogout});

  @override
  Widget build(BuildContext context) {
    double _size = (context.width / 4) - Dimensions.PADDING_SIZE_DEFAULT;

    return InkWell(
      onTap: () {
        Get.toNamed(drawerTileModel!.route!);
      },
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
