import 'package:flutter/material.dart';
import 'package:furniture_store_app/data/models/basket_item.dart';

class BasketItemTile extends StatelessWidget {
  final BasketItem item;
  final VoidCallback onRemove;

  const BasketItemTile({
    super.key,
    required this.item,
    required this.onRemove,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.network(
        item.product.imageUrl,
        width: 60,
        height: 60,
        fit: BoxFit.cover,
        errorBuilder:(context, error, stackTrace) => const Icon(Icons.image_not_supported),
      ),
      title: Text(item.product.name),
      subtitle: Text('Quantity: ${item.quantity}'),
      trailing: IconButton(
        icon: const Icon(Icons.remove_circle_outline),
        onPressed: onRemove,
      )
    );
  }
}