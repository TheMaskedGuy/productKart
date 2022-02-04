import 'dart:collection';
import 'package:flutter/foundation.dart';
import 'package:glowing_love_candles/models/product_cart_version.dart';

class CartModel extends ChangeNotifier {
  final List<ProductCartVer> _products = [];

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
