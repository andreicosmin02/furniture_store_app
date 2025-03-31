import 'package:flutter/material.dart';
import 'package:furniture_store_app/data/models/basket_item.dart';
import 'package:furniture_store_app/data/models/product.dart';

class BasketProvider with ChangeNotifier{
  final List<BasketItem> _items = [];

  List<BasketItem> get items => _items;
  int get itemCount => _items.fold(0, (total, item) => total + item.quantity);
  double get totalPrice => _items.fold(0, (total, item) => total + (item.product.price * item.quantity));

  void addItem(Product product) {
    final existingIndex = _items.indexWhere((item) => item.product.id == product.id);

    if (existingIndex >= 0) {
      _items[existingIndex].quantity++;
    } else {
      _items.add(BasketItem(product: product));
    }

    notifyListeners();
  }

  void removeItem(String productId) {
    _items.removeWhere((item) => item.product.id == productId);
  
    notifyListeners();
  }

  void clearBasket() {
    _items.clear();
    
    notifyListeners();
  }
}