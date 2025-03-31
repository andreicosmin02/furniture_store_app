import 'package:flutter/material.dart';
import 'package:furniture_store_app/data/mock_products.dart';
import 'package:furniture_store_app/state/basket_provider.dart';
import 'package:furniture_store_app/ui/widgets/product_card.dart';
import 'package:provider/provider.dart';

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Furniture Store'),
        actions: [
          IconButton(
            icon: Badge(
              label: Text('${context.watch<BasketProvider>().itemCount}'),
              child: const Icon(Icons.shopping_cart)
            ),
            onPressed: () => Navigator.pushNamed(context, '/basket'),
          ),
        ],
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: mockProducts.length,
        itemBuilder: (context, index) => ProductCard(product: mockProducts[index]),
      )
    );
  }
}