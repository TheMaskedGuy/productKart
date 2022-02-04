import 'package:flutter/material.dart';
import 'package:glowing_love_candles/widgets/product_card_widget.dart';

import 'models/product_info.dart';

class ShopPage extends StatefulWidget {
  const ShopPage({Key? key}) : super(key: key);

  @override
  _ShopPageState createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  List<Widget> searchResult = [];
  void fetchProd(String value) {
    searchResult.clear();
    int i = 0;
    for (var product in ProductInfo.myProducts) {
      if (product.productName.toLowerCase().contains(value.toLowerCase())) {
        searchResult.add(
          ProductCard(productID: i),
        );
      }
      i++;
    }
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> products = [];

    for (var product in ProductInfo.myProducts) {
      products.add(
        ProductCard(productID: product.productId),
      );
    }

    return ListView(
      children: [
        Padding(
          padding:
              const EdgeInsets.symmetric(vertical: 50.0, horizontal: 150.0),
          child: TextField(
            onSubmitted: (value) {
              fetchProd(value);
              setState(() {});
            },
            decoration: const InputDecoration(
                hintText: 'Enter product name...', labelText: 'Search'),
          ),
        ),
        searchResult.isEmpty
            ? GridView.builder(
                itemCount: products.length,
                shrinkWrap: true,
                padding: const EdgeInsets.all(5),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3),
                itemBuilder: (BuildContext context, int index) {
                  return products[index];
                },
              )
            : GridView.builder(
                itemCount: searchResult.length,
                shrinkWrap: true,
                padding: const EdgeInsets.all(5),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3),
                itemBuilder: (BuildContext context, int index) {
                  return searchResult[index];
                },
              ),
        // Row(
        //   children: [
        //     products[0],
        //     products[2],
        //     products[3],
        //     products[4],
        //   ],
        // ),
        // Row(
        //   children: [products[5], products[6], products[7], products[8]],
        // ),
        // Row(
        //   children: [
        //     products[9],
        //   ],
        // ),
      ],
    );
  }
}
