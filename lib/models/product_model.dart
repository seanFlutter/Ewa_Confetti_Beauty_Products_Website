import 'package:flutter/material.dart';

class ProductModel {
  final String? description;
  final String? imagePath;
  final String? price;

  ProductModel({
    @required this.description,
    @required this.imagePath,
    @required this.price,
  });
}
