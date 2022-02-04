import 'package:flutter/material.dart';
import 'package:glowing_love_candles/pages/product_page/product_pages.dart';
import 'package:glowing_love_candles/models/product_info.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({required this.productID, Key? key}) : super(key: key);
  final int productID;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width / 100;

    return Padding(
      padding: EdgeInsets.only(
          left: screenWidth * 3.5,
          right: screenWidth * 3.5,
          bottom: screenWidth * 0,
          top: screenWidth * 3),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ProductPage(
                prodID: productID,
              ),
            ),
          );
        },
        child: Card(
          color: Colors.white,
          elevation: 8.0,
          child: Column(
            children: [
              Image.asset(
                'candle-${productID + 1}.jpg',
                height: screenWidth * 20,
                width: screenWidth * 20,
              ),
              SizedBox(
                height: screenWidth * 1,
              ),
              Text(ProductInfo.myProducts[productID].productName),
              SizedBox(
                height: screenWidth * 1,
              ),
              Text('Rs.${ProductInfo.myProducts[productID].productPrice}'),
            ],
          ),
        ),
      ),
    );
  }
}
