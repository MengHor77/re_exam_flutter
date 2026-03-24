import 'cart_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartCounterUsingProvider extends StatefulWidget {
  const CartCounterUsingProvider({super.key});

  @override
  State<CartCounterUsingProvider> createState() =>
      _CartCounterUsingProviderState();
}

class _CartCounterUsingProviderState
    extends State<CartCounterUsingProvider> {
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context);

    return Scaffold(
      appBar: AppBar(title: const Text('Cart Counter')),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              'Items in Cart:',
              style: TextStyle(fontSize: 24),
            ),
            const SizedBox(height: 10),
            Text(
              '${cart.counter}', // displays the count from provider
              style: const TextStyle(fontSize: 48, color: Colors.blue),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: cart.addToCart, // increments counter in provider
              child: const Text('Add to Cart'),
            ),
          ],
        ),
      ),
    );
  }
}