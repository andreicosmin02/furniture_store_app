import 'package:hive/hive.dart';
import 'package:furniture_store_app/data/models/product.dart';

part 'basket_item.g.dart';

@HiveType(typeId: 1)
class BasketItem {
  @HiveField(0)
  final Product product;

  @HiveField(1)
  int quantity;

  BasketItem({
    required this.product,
    this.quantity = 1,
  });
}