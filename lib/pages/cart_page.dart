import 'package:flutter/material.dart';
import 'package:glowing_love_candles/models/cart.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width / 100;
    double screenHeight = MediaQuery.of(context).size.height / 100;

    var cart = context.watch<CartModel>();
    return Scaffold(
      body: Stack(children: [
        Padding(
          padding: const EdgeInsets.only(top: 18.0),
          child: ListView.builder(
              itemCount: cart.rawFinalProductList.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.only(
                    top: screenHeight * 5,
                    bottom: screenHeight * 5,
                    left: screenWidth * 30,
                    right: screenWidth * 30,
                  ),
                  child: Container(
                    height: screenHeight * 35,
                    width: screenWidth * 60,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(
                        color: Colors.black,
                        width: 2,
                      ),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Image.asset(
                            'candle-1.jpg',
                            height: screenWidth * 20,
                            width: screenWidth * 20,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(18.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Candle Scent: ${cart.rawFinalProductList[index].productName}\n'
                                'Size: ${cart.rawFinalProductList[index].productSize}\n'
                                'Quantity: ${cart.rawFinalProductList[index].productQuantity}\n'
                                'Price: ${cart.rawFinalProductList[index].productPrice}\n',
                                style: TextStyle(fontSize: screenWidth * 1.3),
                              ),
                              const SizedBox(
                                height: 10.0,
                              ),
                              MaterialButton(
                                height: screenHeight * 6,
                                minWidth: screenWidth * 10,
                                hoverColor: Colors.black54,
                                shape: const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.zero),
                                color: Colors.black,
                                onPressed: () {
                                  cart.remove(index);
                                  const snackBar = SnackBar(
                                    content: Text('Item removed!'),
                                  );
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(snackBar);
                                },
                                child: const Text(
                                  'Remove Item',
                                  style: TextStyle(color: Colors.white),
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }),
        ),
        Container(
          color: Colors.black,
          height: 40.0,
          width: screenWidth * 100,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Total Price: Rs.${Provider.of<CartModel>(context).totalPrice}',
                  style: const TextStyle(color: Colors.white),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextButton(
                    onPressed: () {},
                    child: const Text(
                      'CheckOut',
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    )),
              )
            ],
          ),
        ),
      ]),
    );
  }
}

// ListTile(
// leading: const Icon(Icons.done),
// trailing: IconButton(
// icon: const Icon(Icons.remove_circle_outline),
// onPressed: () {
// cart.remove(cart.rawFinalProductList[index]);
// },
// ),
// title: Text(
// cart.rawFinalProductList[index].productName,
// ),
// ),
