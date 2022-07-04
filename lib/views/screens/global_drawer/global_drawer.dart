import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pointer_interceptor/pointer_interceptor.dart';
import 'package:web_portfolio/data/models/drawer_tile_model.dart';
import 'package:web_portfolio/views/screens/global_drawer/widget/drawer_tile.dart';

class GlobalDrawer extends StatelessWidget {
  GlobalDrawer({Key? key}) : super(key: key);
  final List<DrawerTileModel> _menuList = [
    DrawerTileModel(
      iconData: Icons.person_outline,
      title: 'About Us',
      onPressed: () {},
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return PointerInterceptor(
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).hintColor.withOpacity(0.2),
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: List.generate(
              _menuList.length,
              (index) => DrawerTile(
                drawerTileModel: _menuList[index],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
