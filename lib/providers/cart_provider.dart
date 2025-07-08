import 'package:flutter/material.dart';

import '../models/product_model.dart';

class CartProvider with ChangeNotifier {
  final Map<int, int> _quantities = {}; // productId -> quantity

  int getQuantity(int productId) {
    return _quantities[productId] ?? 0;
  }

  void increment(int productId) {
    _quantities[productId] = getQuantity(productId) + 1;
    notifyListeners();
  }
  int get totalItems => _quantities.values.fold(0, (sum, qty) => sum + qty);


  void decrement(int productId) {
    if (getQuantity(productId) > 0) {
      _quantities[productId] = getQuantity(productId) - 1;
      notifyListeners();
    }
  }

  double getTotalAmount(List<ProductModel> products) {
    double total = 0;
    for (var product in products) {
      final qty = getQuantity(product.id);
      total += product.price * qty;
    }
    return total;
  }

  void clearCart() {
    _quantities.clear();
    notifyListeners();
  }

  void removeItem(int productId) {
    _quantities.remove(productId);
    notifyListeners();
  }
}
