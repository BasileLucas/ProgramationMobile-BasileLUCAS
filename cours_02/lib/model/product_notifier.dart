import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:formation_flutter/model/product.dart';

class ProductNotifier extends ChangeNotifier {
  Product? _product;
  Product? get product => _product;

  ProductNotifier() {
    fetchProduct();
  }

  Future<void> fetchProduct() async {
    _product = null;
    notifyListeners();

    final dio = Dio();
    const barcode = '3017620422003';
    
    try {
      final response = await dio.get(
        'https://world.openfoodfacts.org/api/v2/product/$barcode',
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = response.data;
        if (data.containsKey('product')) {
          _product = Product.fromJson(data['product']);
        }
      }
    } catch (e) {
      debugPrint(e.toString());
    }

    notifyListeners();
  }
}