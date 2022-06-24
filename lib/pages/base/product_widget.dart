import 'package:flutter/material.dart';
import 'package:web_portfolio/models/product_model.dart';

class ProductWidget extends StatelessWidget {
  const ProductWidget({this.productModel, Key key}) : super(key: key);
  final ProductModel productModel;
  @override
  Widget build(BuildContext context) {
    return Container(
     // color: Colors.green,
      //height: 600,
      child: Column(crossAxisAlignment: CrossAxisAlignment.center,
        children:<Widget> [
          Stack(
            children: <Widget>[
              Image.asset('${productModel.imagePath}', fit: BoxFit.cover)
            ],
          ),
          Text('${productModel.description}', overflow: TextOverflow.ellipsis,),
          Text('${productModel.price}')
        ],
      ),
    );
  }
}
