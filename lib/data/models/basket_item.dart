import 'package:furniture_store_app/data/models/product.dart';

class BasketItem {
  final Product product;
  int quantity;

  BasketItem({
    required this.product,
    this.quantity = 1,
  });
}