import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import '../models/product.dart';

class ProductsProvider with ChangeNotifier {
  List<Product> _products = [];

  List<Product> get products => _products;

  Future<void> loadProducts() async {
    final String response = await rootBundle.loadString('assets/produtos_halloween.json');
    final data = await json.decode(response);
    final List<dynamic> produtosJson = data['produtos_halloween'];
    _products = produtosJson.map((json) => Product.fromJson(json)).toList();
    notifyListeners();
  }
}
