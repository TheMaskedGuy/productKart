import 'dart:collection';
import 'package:flutter/foundation.dart';
import 'package:glowing_love_candles/models/product_cart_version.dart';

class CartModel extends ChangeNotifier {
  final List<ProductCartVer> _products = [];

  /// An unmodifiable view of the items in the cart.
  UnmodifiableListView<ProductCartVer> get rawFinalProductList =>
      UnmodifiableListView(_products);

  /// The current total price of all items

  double get totalPrice {
    double totPrice = 0;
    for (var productItem in _products) {
      totPrice = totPrice + productItem.productPrice;
    }
    return totPrice;
  }

  // void getTotalPrice () {
  //   for (var productItem in _products) {
  //     totPrice = totPrice + productItem.productPrice;
  //   }
  // }

  /// Adds [product] to cart. This and [removeAll] are the only ways to modify the
  /// cart from the outside.
  void add(ProductCartVer product) {
    _products.add(product);
    notifyListeners();
  }

  void removeAll() {
    _products.clear();
    notifyListeners();
  }

  void remove(int index) {
    _products.removeAt(index);

    notifyListeners();
  }
}
