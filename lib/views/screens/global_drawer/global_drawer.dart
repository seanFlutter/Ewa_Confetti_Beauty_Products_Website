import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pointer_interceptor/pointer_interceptor.dart';
import 'package:web_portfolio/views/screens/global_drawer/widget/drawer_tile.dart';
import 'package:web_portfolio/views/screens/home/widgets/header.dart';

class GlobalDrawer extends StatelessWidget {
  GlobalDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PointerInterceptor(
      child: Container(
        decoration: BoxDecoration(
         // color: Theme.of(context).hintColor.withOpacity(0.2),
          color: Colors.red,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: List.generate(
            drawerHeaderItems.length,
            (index) => DrawerTile(
              drawerHeaderItem: drawerHeaderItems[index],
            ),
          ),
        ),
      ),
    );
  }
}
