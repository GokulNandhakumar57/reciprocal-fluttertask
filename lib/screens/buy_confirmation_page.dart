import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../services/data.dart';

class BuyConfirmationPage extends StatelessWidget {
  final Map<String, dynamic> product;

  const BuyConfirmationPage({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Confirm Your Purchase"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Center(
              child: Image.network(product['image'], height: 200),
            ),
            const SizedBox(height: 20),
            Text(
              product['title'],
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text(
              '\$${product['price']}',
              style: const TextStyle(fontSize: 20, color: Colors.green),
            ),
            const SizedBox(height: 20),
            Text(
              product['description'],
              style: const TextStyle(fontSize: 16),
            ),
            const Spacer(),
            ElevatedButton(
              onPressed: () {
                final controller = Provider.of<Controller>(context, listen: false);
                controller.placeOrder();

                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('${product['title']} has been purchased!')),
                );
                Navigator.pop(context);
              },
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 16),
                backgroundColor: Colors.green,
              ),
              child: const Text(
                'Confirm Purchase',
                style: TextStyle(fontSize: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
