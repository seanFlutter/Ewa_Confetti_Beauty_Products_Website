import 'package:flutter/material.dart';

class DrawerHeaderItem {
  final String? title;
  final VoidCallback? onTap;
  final bool isButton;
  final IconData? iconData;

  DrawerHeaderItem({
    this.title,
    this.onTap,
    this.isButton = false,this.iconData
  });
}
