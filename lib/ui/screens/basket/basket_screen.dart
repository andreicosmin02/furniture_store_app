import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:furniture_store_app/state/basket_provider.dart';
import 'package:furniture_store_app/ui/widgets/basket_item_tile.dart';

class BasketScreen extends StatelessWidget {
  const BasketScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final basketProvider = context.watch<BasketProvider>();

    return Scaffold(
      appBar: AppBar(title: const Text('Your Basket')),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder( 
              itemCount: basketProvider.items.length,
              itemBuilder:(context, index) {
                final item = basketProvider.items[index];
                return BasketItemTile(
                  item: item,
                  onRemove: () => basketProvider.removeItem(item.product.id),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Text(
                  'Total: ${basketProvider.totalPrice.toStringAsFixed(2)} Lei',
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {}, // We'll implement checkout later
                  child: const Text('Proceed to Checkout'),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}