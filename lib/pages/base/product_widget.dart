import 'package:flutter/material.dart';
import 'package:web_portfolio/models/product_model.dart';

class ProductWidget extends StatelessWidget {
  const ProductWidget({this.productModel, Key key}) : super(key: key);
  final ProductModel productModel;
  @override
  Widget build(BuildContext context) {
    return Container(height: 600,
      child: Column(
        children: [
          Stack(
            children: <Widget>[Image.asset('${productModel.imagePath}', fit: BoxFit.contain,)],
          ),
          Text('${productModel.description}'),
          Text('${productModel.price}')
        ],
      ),
    );
  }
}
