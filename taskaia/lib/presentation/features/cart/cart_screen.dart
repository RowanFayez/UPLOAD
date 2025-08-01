import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../core/di/injection.dart';
import '../../../data/repositories/product_repository.dart';
import '../../../data/models/cart.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Cart>>(
      future: getIt<ProductRepository>().apiClient.getCarts(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }
        if (snapshot.hasError) {
          return Center(child: Text('Error: \\${snapshot.error}'));
        }
        final carts = snapshot.data ?? [];
        if (carts.isEmpty) {
          return const Center(child: Text('No carts found'));
        }
        return ListView.builder(
          itemCount: carts.length,
          itemBuilder: (context, index) {
            final cart = carts[index];
            return Card(
              margin: const EdgeInsets.all(12),
              child: ListTile(
                title: Text('Cart #${cart.id}'),
                subtitle: Text('User: ${cart.userId}\nDate: ${cart.date}'),
                trailing: Text('Items: ${cart.products.length}'),
              ),
            );
          },
        );
      },
    );
  }
}
