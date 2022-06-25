import 'package:flutter/material.dart';
import 'package:web_portfolio/models/product_model.dart';
import 'package:web_portfolio/utils/color_palette.dart';
import 'package:web_portfolio/utils/font_styles.dart';

class ProductWidget extends StatelessWidget {
  const ProductWidget({this.productModel, Key? key}) : super(key: key);
  final ProductModel? productModel;
  @override
  Widget build(BuildContext context) {
    return Container(
     //  color: Colors.green,
      //height: 600,
      child: Column(mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Expanded(
            child: Card(
              clipBehavior: Clip.antiAlias,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(2),
              ),
              child: AspectRatio(
                aspectRatio: 1,
                child:       Image.asset('${productModel!.imagePath}',
                    fit: BoxFit.cover),
              ),
            ),
          ),
          Text(
            '${productModel!.description}',
            overflow: TextOverflow.ellipsis, softWrap: true,  style: rosarivo14.copyWith(color: Palette.pinkAlternate),
          ),
          Text(
            'N${productModel!.price}',
         style: karla15,
          ),
        ],
      ),
    );
  }
}
