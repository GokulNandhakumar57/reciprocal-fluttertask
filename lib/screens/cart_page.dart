import 'package:flutter/material.dart';
import '../services/data.dart';

class CartPage extends StatelessWidget {
  final Controller controller;

  const CartPage({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Cart"),
      ),
      body: controller.getCarts().isEmpty
          ? const Center(child: Text("Your cart is empty"))
          : ListView.builder(
        itemCount: controller.getCarts().length,
        itemBuilder: (context, index) {
          final item = controller.getCarts()[index];
          return Card(
            child: ListTile(
              title: Text(item['title']),
              subtitle: Text('\$${item['price']}'),
            ),
          );
        },
      ),
    );
  }
}
