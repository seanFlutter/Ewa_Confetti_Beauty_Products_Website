import 'package:flutter/material.dart';

class DrawerTileModel {
  final String? title;
  final IconData? iconData;
  final VoidCallback? onPressed;
  DrawerTileModel({ this.iconData, this.title, this.onPressed});
}