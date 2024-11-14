import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Controller with ChangeNotifier {
  List<dynamic> products = [];
  List<Map<String, dynamic>> carts = [];
  List<Map<String, dynamic>> orders = [];

  // Fetch Products from API
  Future<void> getProducts() async {
    try {
      final response = await http.get(Uri.parse('https://fakestoreapi.com/products'));
      if (response.statusCode == 200) {
        products = json.decode(response.body);
        notifyListeners(); // Update UI when products are loaded
      } else {
        throw Exception('Failed to load products');
      }
    } catch (error) {
      print('Error fetching products: $error');
    }
  }

  // Add an item to the Cart
  void addToCart(Map<String, dynamic> item) {
    carts.add(item);
    notifyListeners(); // Update UI when item is added
  }

  // Place Order from Cart Items
  void placeOrder() {
    if (carts.isNotEmpty) {
      orders.addAll(carts);
      carts.clear(); // Clear cart after placing order
      notifyListeners(); // Update UI when order is placed
    }
  }

  // Add a single item directly to Orders (e.g., via "Buy" button)
  void addOrder(Map<String, dynamic> item) {
    orders.add(item);
    notifyListeners(); // Update UI when item is added to orders
  }

  // Get list of Orders
  List<Map<String, dynamic>> getOrders() {
    return orders;
  }

  // Get list of Cart items
  List<Map<String, dynamic>> getCarts() {
    return carts;
  }
}
