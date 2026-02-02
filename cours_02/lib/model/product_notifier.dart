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

    const barcode = '5000159484695'; 
    
    try {
      final response = await dio.get(
        'https://world.openfoodfacts.org/api/v2/product/$barcode',
      );

      if (response.statusCode == 200) {
        final productResponse = ProductResponse.fromJSON(response.data);
        
        if (productResponse.status == 1 && productResponse.product != null) {
          final data = productResponse.product!;
          
          _product = Product(
            barcode: barcode,
            name: data.name,
            picture: data.image,
            nutriScore: Product.parseNutriScore(data.grade),
          );
        }
      }
    } catch (e) {
      debugPrint('Erreur réseau ou mapping : $e');
    } finally {
      notifyListeners(); 
    }
  }
}