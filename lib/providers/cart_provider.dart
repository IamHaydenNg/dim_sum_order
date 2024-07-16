import 'package:flutter/material.dart';
import 'package:dim_sum_order/models/dimsum.dart';

class CartProvider with ChangeNotifier {
  List<DimSum> _items = [];

  List<DimSum> get items => _items;

  int get itemCount => _items.length;

  void addItem(DimSum dimSum) {
    _items.add(dimSum);
    notifyListeners();
  }

  void removeItem(DimSum dimSum) {
    final DimSum firstItem = _items
        .firstWhere((x) => x.id == dimSum.id && x.category == dimSum.category);
    _items.remove(firstItem);
    notifyListeners();
  }

  void clearCart() {
    _items = [];
    notifyListeners();
  }
}
