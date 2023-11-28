import 'package:flutter/material.dart';

class Product {
  String name;
  double price;

  Product({required this.name, required this.price});
}

class S4536 extends StatelessWidget {
  const S4536({super.key});

  @override
  Widget build(BuildContext context) {
    // Erzeuge eine Liste von Produkten
    List<Product> products = [
      Product(name: 'Callifornia Haze', price: 39.99),
      Product(name: 'Amnesia Haze', price: 29.99),
      Product(name: 'Lemon Haze', price: 9.99),
      Product(name: 'Gelato Haze/Kush', price: 49.99),
      Product(name: 'Blueberry Kush', price: 9.99),
    ];

    return ListView(
      shrinkWrap: true,
      children: products.map((Product product) {
        return ListTile(
          leading: Icon(Icons.shopping_cart),
          title: Text(product.name),
          subtitle: Text('\€${product.price.toStringAsFixed(2)}'),
        );
      }).toList(),
    );
  }
}
