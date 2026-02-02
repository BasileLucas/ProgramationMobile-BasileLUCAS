import 'package:flutter/material.dart';
import 'package:formation_flutter/model/product.dart';

class ProductNotifier extends ChangeNotifier {
  Product? _currentProduct;

  Product? get product => _currentProduct;

  ProductNotifier() {
    refreshProduct();
  }

  Future<void> refreshProduct() async {
    _currentProduct = null;
    notifyListeners();

    await Future.delayed(const Duration(seconds: 2));

    _currentProduct = generateProduct();

    notifyListeners();
  }
}