import 'dart:async';
import 'package:flutter/material.dart';

// Product model
class Product {
  int id;
  String name;
  double price;

  Product({required this.id, required this.name, required this.price});
}

// Mock API service
class MockProductApi {
  // Fake database
  static List<Product> _products = [
    Product(id: 1, name: "Laptop", price: 1200),
    Product(id: 2, name: "Phone", price: 800),
  ];

  // GET /products
  static Future<List<Product>> getProducts() async {
    await Future.delayed(Duration(seconds: 1)); // simulate network delay
    return _products;
  }

  // POST /products
  static Future<Product> addProduct(String name, double price) async {
    await Future.delayed(Duration(seconds: 1));
    final newProduct = Product(id: _products.length + 1, name: name, price: price);
    _products.add(newProduct);
    return newProduct;
  }

  // PUT /products/{id}
  static Future<Product?> updateProduct(int id, String name, double price) async {
    await Future.delayed(Duration(seconds: 1));
    final product = _products.firstWhere((p) => p.id == id, orElse: () => Product(id: 0, name: '', price: 0));
    if (product.id != 0) {
      product.name = name;
      product.price = price;
      return product;
    }
    return null;
  }

  // DELETE /products/{id}
  static Future<bool> deleteProduct(int id) async {
    await Future.delayed(Duration(seconds: 1));
    _products.removeWhere((p) => p.id == id);
    return true;
  }
}

// Flutter UI
class CrudOperationUsingRestApi extends StatefulWidget {
  const CrudOperationUsingRestApi({super.key});

  @override
  State<CrudOperationUsingRestApi> createState() => _CrudOperationUsingRestApiState();
}

class _CrudOperationUsingRestApiState extends State<CrudOperationUsingRestApi> {
  List<Product> products = [];
  bool loading = true;

  @override
  void initState() {
    super.initState();
    fetchProducts();
  }

  void fetchProducts() async {
    final data = await MockProductApi.getProducts();
    setState(() {
      products = data;
      loading = false;
    });
  }

  void addProduct() async {
    final product = await MockProductApi.addProduct("New Product", 100);
    setState(() {
      products.add(product);
    });
  }

  void editProduct(Product p) async {
    final updated = await MockProductApi.updateProduct(p.id, "${p.name} (Edited)", p.price + 50);
    if (updated != null) {
      setState(() {});
    }
  }

  void deleteProduct(Product p) async {
    await MockProductApi.deleteProduct(p.id);
    setState(() {
      products.remove(p);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("CRUD Product List")),
      body: loading
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: products.length,
              itemBuilder: (context, index) {
                final p = products[index];
                return ListTile(
                  title: Text(p.name),
                  subtitle: Text("\$${p.price}"),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: Icon(Icons.edit, color: Colors.orange),
                        onPressed: () => editProduct(p),
                      ),
                      IconButton(
                        icon: Icon(Icons.delete, color: Colors.red),
                        onPressed: () => deleteProduct(p),
                      ),
                    ],
                  ),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: addProduct,
        child: Icon(Icons.add),
      ),
    );
  }
}