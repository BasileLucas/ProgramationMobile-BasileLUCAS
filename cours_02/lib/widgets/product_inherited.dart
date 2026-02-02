import 'package:flutter/material.dart';
import 'package:formation_flutter/model/product.dart';

class ProductInherited extends InheritedWidget {
  final Product product;

  const ProductInherited({
    super.key,
    required this.product,
    required super.child,
  });

  // Méthode de récupération standard
  static ProductInherited? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<ProductInherited>();
  }

  @override
  bool updateShouldNotify(ProductInherited oldWidget) {
    // On notifie les enfants si le produit est différent
    return product != oldWidget.product;
  }
}