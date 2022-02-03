import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:glowing_love_candles/home_page.dart';
import 'package:glowing_love_candles/models/cart.dart';
import 'package:glowing_love_candles/models/product_cart_version.dart';
import 'package:glowing_love_candles/models/product_info.dart';
import 'package:glowing_love_candles/widgets/product_card_widget.dart';
import 'package:provider/provider.dart';

import '../cart_page.dart';

class ProductPage extends StatefulWidget {
  final int prodID;
  const ProductPage({required this.prodID, Key? key}) : super(key: key);

  @override
  _ProductPageState createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  String prodSize = '6 x 15';
  double prodPrice = 499;
  int prodQuantity = 1;

  @override
  Widget build(BuildContext context) {
    double userWidth = MediaQuery.of(context).size.width / 100;
    double userHeight = MediaQuery.of(context).size.height / 100;

    if (prodSize == '6 x 15') {
      prodPrice = 499;
    } else if (prodSize == '25') {
      prodPrice = 749;
    } else if (prodSize == '45') {
      prodPrice = 899;
    } else if (prodSize == '85') {
      prodPrice = 999;
    } else {
      prodPrice = 1399;
    }

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: WillPopScope(
          onWillPop: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => HomePage()));
            throw 'error';
          },
          child: ListView(
            children: [
              Container(
                color: Colors.black,
                width: userWidth * 100,
                height: userHeight * 7.6,
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: IconButton(
                      //hoverColor: Colors.pink,
                      splashRadius: 0.1,
                      highlightColor: Colors.pink,

                      icon: Icon(
                        Icons.shopping_cart_rounded,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => CartPage()));
                      },
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: userWidth * 10,
                  vertical: userHeight * 10,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: userWidth * 50,
                      height: userHeight * 80,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        image: DecorationImage(
                            image: AssetImage(
                                'assets/candle-${widget.prodID + 1}.jpg'),
                            fit: BoxFit.scaleDown),
                      ),
                    ),
                    SizedBox(
                      width: userWidth * 1,
                    ),
                    Card(
                      color: Colors.white,
                      elevation: 8.0,
                      child: Padding(
                        padding: EdgeInsets.only(
                            top: userHeight * 10,
                            bottom: userHeight * 5,
                            left: userWidth * 4,
                            right: userWidth * 4),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '${ProductInfo.myProducts[widget.prodID].productName} Candle',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 2.0,
                                  fontSize: userWidth * 1.8),
                            ),
                            SizedBox(
                              height: 20.0,
                            ),
                            Row(
                              children: [
                                Text(
                                  'Choose Size: ',
                                  style: TextStyle(
                                      overflow: TextOverflow.ellipsis,
                                      fontSize: userWidth * 1.3),
                                ),
                                SizedBox(
                                  width: 5.0,
                                ),
                                DropdownButton<String>(
                                  value: prodSize,
                                  //icon: const Icon(Icons.arrow_downward),
                                  elevation: 16,
                                  style: const TextStyle(color: Colors.black),
                                  underline: Container(
                                    height: 2,
                                    color: Colors.pink,
                                  ),
                                  items: <String>[
                                    '6 x 15',
                                    '25',
                                    '45',
                                    '85',
                                    '120'
                                  ].map<DropdownMenuItem<String>>(
                                      (String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(value),
                                    );
                                  }).toList(),
                                  onChanged: (String? newValue) {
                                    setState(() {
                                      prodSize = newValue!;
                                    });
                                  },
                                ),
                                SizedBox(
                                  width: 5.0,
                                ),
                                Text(
                                  'ml',
                                  style: TextStyle(
                                      overflow: TextOverflow.ellipsis,
                                      fontSize: userWidth * 1.3),
                                )
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                  'Quantity: ',
                                  style: TextStyle(
                                      overflow: TextOverflow.ellipsis,
                                      fontSize: userWidth * 1.3),
                                ),
                                SizedBox(
                                  width: 5.0,
                                ),
                                DropdownButton<int>(
                                  value: prodQuantity,
                                  //icon: const Icon(Icons.arrow_downward),
                                  elevation: 16,
                                  style: const TextStyle(color: Colors.black),
                                  underline: Container(
                                    height: 2,
                                    color: Colors.pink,
                                  ),
                                  items: <int>[
                                    1,
                                    2,
                                    3,
                                    4,
                                    5,
                                    6,
                                    7,
                                    8,
                                    9,
                                    10,
                                    11,
                                    12,
                                    13,
                                    14,
                                    15
                                  ].map<DropdownMenuItem<int>>((int value) {
                                    return DropdownMenuItem<int>(
                                      value: value,
                                      child: Text(value.toString()),
                                    );
                                  }).toList(),
                                  onChanged: (int? newValue) {
                                    setState(() {
                                      prodQuantity = newValue!;
                                    });
                                  },
                                ),
                                const SizedBox(
                                  width: 5.0,
                                ),
                                Text(
                                  'Pcs.',
                                  style: TextStyle(
                                      overflow: TextOverflow.ellipsis,
                                      fontSize: userWidth * 1.3),
                                )
                              ],
                            ),
                            SizedBox(
                              height: userHeight * 2,
                            ),
                            Text(
                              'Rs.${prodPrice * prodQuantity}',
                              style: const TextStyle(
                                  fontSize: 18.0,
                                  letterSpacing: 2.0,
                                  fontWeight: FontWeight.w500),
                            ),
                            SizedBox(
                              height: userHeight * 7,
                            ),

                            //MAIN ACTION SITEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEE
                            MaterialButton(
                              height: userHeight * 8,
                              minWidth: userWidth * 21,
                              hoverColor: Colors.pink,
                              shape: const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.zero),
                              onPressed: () {
                                var cart = CartModel();
                                var productCart = ProductCartVer(
                                    productId: widget.prodID,
                                    productName: ProductInfo
                                        .myProducts[widget.prodID].productName,
                                    productPrice: prodPrice * prodQuantity,
                                    productSize: prodSize,
                                    productQuantity: prodQuantity);
                                // print(productCart.productQuantity);
                                cart.add(productCart);
                                Provider.of<CartModel>(context, listen: false)
                                    .add(productCart);
                                print(cart.rawFinalProductList.length);

                                const snackBar = SnackBar(
                                  content: Text('Item added to Cart!'),
                                );
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(snackBar);
                              },
                              color: Colors.pinkAccent,
                              child: const Text(
                                'ADD TO CART',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14.0,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
              const Divider(
                indent: 30,
                endIndent: 30,
                color: Colors.pinkAccent,
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text(
                  '            -${ProductInfo.myProducts[widget.prodID].productDescr}',
                  overflow: TextOverflow.ellipsis,
                  maxLines: 10,
                  style: TextStyle(
                      fontSize: userWidth * 1.8,
                      fontWeight: FontWeight.w300,
                      letterSpacing: 1.0,
                      wordSpacing: 2.0,
                      overflow: TextOverflow.ellipsis,
                      fontFamily: 'DancingScript'),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
