import 'package:flutter/material.dart';

import '../Models/product_model.dart';

class CartProvider extends ChangeNotifier {
  List<ProductModel> productsInCart = <ProductModel>[];

  void addToCart(ProductModel e) {
    productsInCart.add(e);
    notifyListeners();
  }
}
