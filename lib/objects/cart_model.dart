import 'dart:collection';

import 'package:flutter/material.dart';
import 'product.dart';

class CartModel extends ChangeNotifier {
  final List<Product> _products = [];
  int cuantityProductOrder = 0;

  UnmodifiableListView<Product> get products => UnmodifiableListView(_products);

  int get totalPrice {
    int total = 0;
    for (int i = 0; i < _products.length; i++) {
      total = _products[i].price + total;
    }
    //notifyListeners();
    return total;
  }
  
  void add(Product products) {
    _products.add(products);
    notifyListeners();
  }

  void removeProductSelected(Product product){
    _products.remove(product);
  }

  void removeAll() {
    _products.clear();
    notifyListeners();
  }
}
