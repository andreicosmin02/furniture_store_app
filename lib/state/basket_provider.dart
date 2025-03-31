import 'package:flutter/material.dart';
import 'package:furniture_store_app/data/models/basket_item.dart';
import 'package:furniture_store_app/data/models/product.dart';
import 'package:hive/hive.dart';

class BasketProvider with ChangeNotifier {
  late final Box _basketBox;
  List<BasketItem> _items = [];

  List<BasketItem> get items => _items;
  int get itemCount => _items.fold(0, (total, item) => total + item.quantity);
  double get totalPrice => _items.fold(0, (total, item) => total + (item.product.price * item.quantity));

  BasketProvider() {
    _init();
  }

  Future<void> _init() async {
    _basketBox = Hive.box('basketBox');
    _loadBasket();
  }

  void _loadBasket() {
    final savedItems = _basketBox.get('items', defaultValue: []);
    _items = List<BasketItem>.from(savedItems);
    notifyListeners();
  }

  void _saveBasket() {
    _basketBox.put('items', _items);
  }

  void addItem(Product product) {
    final existingIndex = _items.indexWhere((item) => item.product.id == product.id);

    if (existingIndex >= 0) {
      _items[existingIndex].quantity++;
    } else {
      _items.add(BasketItem(product: product));
    }

    notifyListeners();

    _saveBasket();
  }

  void removeItem(String productId) {
    _items.removeWhere((item) => item.product.id == productId);
  
    notifyListeners();

    _saveBasket();
  }

  void clearBasket() {
    _items.clear();
    
    notifyListeners();
    
    _saveBasket();
  }
}